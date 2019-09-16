//
//  AlbumsInteractor.swift
//  Viper
//
//  Created by Victor Alejandria on 30/08/2019.
//  Copyright (c) 2019 Victor Alejandria. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class AlbumsInteractor {
	
	var privateServices: APIServicesInterfaces!
	
}

// MARK: - Extensions -

extension AlbumsInteractor: AlbumsInteractorInterface {
	var services: APIServicesInterfaces {
		get {
			return privateServices
		}
		set {
			privateServices = newValue
		}
	}
	
	convenience init(services: APIServicesInterfaces) {
		self.init()
		
		self.services = services
	}
	
	func getAlbumBy(id: Int, completion: @escaping AlbumCompletionBlock) {
		self.services.getAlbumBy(id: id, completion: completion)
	}
	
	func getAlbumsBy(user: Int, completion: @escaping AlbumsCompletionBlock) {
		self.services.getAlbumsBy(user: user, completion: completion)
	}
	
}
