//
//  Services.swift
//  Viper
//
//  Created by Victor Alejandria on 30/08/2019.
//  Copyright © 2019 Victor Alejandria. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class Services: BaseServices, APIServicesInterfaces {

	func getUsers() -> Driver<[ServicesUser]>{
		let components = URLComponents(string: Constants.API.URLBase.appendingPathComponent("users").absoluteString)!
		let urlRequest = URLRequest(url: components.url!)
		let result:Driver<[ServicesUser]> = remoteArrayStream(urlRequest)
			.observeOn(ConcurrentDispatchQueueScheduler(qos: .background))
			.single()
			.asDriver(onErrorJustReturn: [ServicesUser]())

		return result
	}

	func getUsersBy(id: Int) -> Driver<ServicesUser> {
		let components = URLComponents(string: Constants.API.URLBase.appendingPathComponent("users/\(id)").absoluteString)!
		let urlRequest = URLRequest(url: components.url!)
		let result:Driver<ServicesUser> = remoteStream(urlRequest)
			.observeOn(ConcurrentDispatchQueueScheduler(qos: .background))
			.single()
			.asDriver(onErrorJustReturn: ServicesUser())

		return result
	}

	func getAlbumsBy(user: Int) -> Driver<[Album]> {
		let url = "albums"
		var components = URLComponents(string: Constants.API.URLBase.appendingPathComponent(url).absoluteString)!
		let param = ["userId":String(user)]
		var items = [URLQueryItem]()
		for (key,value) in param {
			items.append(URLQueryItem(name: key, value: value))
		}
		components.queryItems = items
		let request = URLRequest(url: components.url!)

		let result:Driver<[Album]> = remoteArrayStream(request)
			.observeOn(ConcurrentDispatchQueueScheduler(qos: .background))
			.single()
			.asDriver(onErrorJustReturn: [Album]())

		return result
	}

	func getAlbumBy(id: Int) -> Driver<Album> {
		let url = "albums/\(id)"
		let request = URLRequest(url: Constants.API.URLBase.appendingPathComponent(url))

		let result:Driver<Album> = remoteStream(request)
			.observeOn(ConcurrentDispatchQueueScheduler(qos: .background))
			.single()
			.asDriver(onErrorJustReturn: Album())

		return result
	}

	func getPhotosBy(album: Int) -> Driver<[Photo]> {
		let url = "photos"
		var components = URLComponents(string: Constants.API.URLBase.appendingPathComponent(url).absoluteString)!
		let param = ["albumId": String(album)]
		var items = [URLQueryItem]()
		for (key,value) in param {
			items.append(URLQueryItem(name: key, value: value))
		}
		components.queryItems = items
		let request = URLRequest(url: components.url!)

		let result:Driver<[Photo]> = remoteArrayStream(request)
			.observeOn(ConcurrentDispatchQueueScheduler(qos: .background))
			.single()
			.asDriver(onErrorJustReturn: [Photo]())

		return result
	}

	func downloadImageDataFrom(url: String) -> Driver<Data> {
		let request = URLRequest(url: URL(string: url)!)

		let result:Driver<Data> = remoteData(request)
			.observeOn(ConcurrentDispatchQueueScheduler(qos: .background))
			.single()
			.asDriver(onErrorJustReturn: Data())

		return result
	}

}
