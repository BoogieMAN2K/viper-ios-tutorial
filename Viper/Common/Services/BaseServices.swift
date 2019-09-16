//
//  BaseServices.swift
//  Viper
//
//  Created by Victor Alejandria on 16/09/2019.
//  Copyright © 2019 Victor Alejandria. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class BaseServices {
	
	static let session = URLSession(configuration: URLSessionConfiguration.ephemeral)
	
	func remoteStream<T: Codable>(_ request: URLRequest) -> Observable<T> {
		return Observable.create { observer in
			let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
				do {
					let record: T = try JSONDecoder().decode(T.self, from: data ?? Data())
					observer.onNext(record)
				} catch let error {
					observer.onError(error)
				}
				observer.onCompleted()
			}
			task.resume()
			
			return Disposables.create {
				task.cancel()
			}
		}
	}
	
	func remoteArrayStream<T: Codable>(_ request: URLRequest) -> Observable<[T]> {
		return Observable.create { observer in
			let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
				do {
					let records: [T] = try JSONDecoder().decode(Array<T>.self, from: data ?? Data())
					observer.onNext(records)
				} catch let error {
					observer.onError(error)
				}
				observer.onCompleted()
			}
			task.resume()
			
			return Disposables.create {
				task.cancel()
			}
		}
	}
}
