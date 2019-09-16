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

	func getAlbumsBy(user: Int, completion: @escaping AlbumsCompletionBlock) {
		let url = "albums"
		var components = URLComponents(string: Constants.API.URLBase.appendingPathComponent(url).absoluteString)!
		let param = ["userId":String(user)]
		var items = [URLQueryItem]()
		for (key,value) in param {
			items.append(URLQueryItem(name: key, value: value))
		}
		components.queryItems = items
		let request = URLRequest(url: components.url!)

		let task = Services.session.dataTask(with: request) { (data, response, error) in
			guard let data = data, let response = try? JSONDecoder().decode(Array<Album>.self, from: data) else { return }
			completion(response)
		}

		task.resume()
	}

	func getAlbumBy(id: Int, completion: @escaping AlbumCompletionBlock) {
		let url = "albums/\(id)"
		let task = Services.session.dataTask(with: Constants.API.URLBase.appendingPathComponent(url)) { (data, response, error) in
			guard let data = data, let response = try? JSONDecoder().decode(Album.self, from: data) else { return }
			completion(response)
		}

		task.resume()
	}

	func getPhotosBy(album: Int, completion: @escaping PhotosCompletionBlock) {
		let url = "photos"
		var components = URLComponents(string: Constants.API.URLBase.appendingPathComponent(url).absoluteString)!
		let param = ["albumId": String(album)]
		var items = [URLQueryItem]()
		for (key,value) in param {
			items.append(URLQueryItem(name: key, value: value))
		}
		components.queryItems = items
		let request = URLRequest(url: components.url!)

		let task = Services.session.dataTask(with: request) { (data, response, error) in
			guard let data = data, let response = try? JSONDecoder().decode(Array<Photo>.self, from: data) else { return }
			completion(response)
		}

		task.resume()
	}

	func downloadImage(url: String, completion: @escaping DownloadedImageCompletionBlock) {
		let finalURL: URL = URL(string: url)!
		let task = Services.session.dataTask(with: finalURL) { (data, response, error) in
			if (error != nil) {
				print("Error \(String(describing: error?.localizedDescription))")
				return
			}

			guard let data = data else { return }
			completion(data)
		}

		task.resume()
	}

}
