//
//  MockServices.swift
//  Viper
//
//  Created by Victor Alejandria on 30/08/2019.
//  Copyright © 2019 Victor Alejandria. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class MockServices: BaseServices, APIServicesInterfaces {
	func getAlbumsBy(user: Int) -> Driver<[Album]> {
		fatalError()
	}

	func getAlbumBy(id: Int) -> Driver<Album> {
		fatalError()
	}

	func getPhotosBy(album: Int) -> Driver<[Photo]> {
		fatalError()
	}

	func downloadImageDataFrom(url: String) -> Driver<Data> {
		fatalError()
	}

	func getUsers() -> Driver<[ServicesUser]> {
		fatalError()
	}

	func getUsersBy(id: Int) -> Driver<ServicesUser> {
		fatalError()
    }

}
