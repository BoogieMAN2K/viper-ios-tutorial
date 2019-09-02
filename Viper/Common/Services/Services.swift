//
//  Services.swift
//  Viper
//
//  Created by Victor Alejandria on 30/08/2019.
//  Copyright © 2019 Victor Alejandria. All rights reserved.
//

import Foundation

final class Services {

	static func getUsers(completion: @escaping UsersCompletionBlock) {
		let session = URLSession(configuration: URLSessionConfiguration.ephemeral)
		let task = session.dataTask(with: Constants.API.URLBase.appendingPathComponent("users")) { (data, response, error) in
			guard let data = data, let response = try? JSONDecoder().decode(Array<ServicesUser>.self, from: data) else { return }
			completion(response)
		}

		task.resume()
	}

	static func getUsersBy(id: Int, completion: @escaping UserCompletionBlock) {
		let session = URLSession(configuration: URLSessionConfiguration.ephemeral)
		let url = "users/\(id)"
		let task = session.dataTask(with: Constants.API.URLBase.appendingPathComponent(url)) { (data, response, error) in
			guard let data = data, let response = try? JSONDecoder().decode(ServicesUser.self, from: data) else { return }
			completion(response)
		}

		task.resume()
	}

}
