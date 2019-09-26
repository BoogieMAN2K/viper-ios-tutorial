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
	
	func remoteData(_ request: URLRequest) -> Observable<Data> {
		return URLSession.shared.rx.response(request: request)
			.map{ return $1	}
	}

	func remoteStream<T: Codable>(_ request: URLRequest) -> Observable<T> {
		return URLSession.shared.rx.response(request: request)
			.map{ (_, data) in
				guard let record: T = try? JSONDecoder().decode(T.self, from: data) else { throw VIPERError.decodingJSON }
				return record
		}
	}
	
	func remoteArrayStream<T: Codable>(_ request: URLRequest) -> Observable<[T]> {
		return URLSession.shared.rx.response(request: request)
			.map{ (_, data) in
				guard let records: [T] = try? JSONDecoder().decode(Array<T>.self, from: data) else { throw VIPERError.decodingJSON }
				return records
		}
	}
}
