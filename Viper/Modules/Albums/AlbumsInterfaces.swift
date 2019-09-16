//
//  AlbumsInterfaces.swift
//  Viper
//
//  Created by Victor Alejandria on 30/08/2019.
//  Copyright (c) 2019 Victor Alejandria. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import RxSwift
import RxCocoa

typealias AlbumsCompletionBlock = ([Album]) -> (Void)
typealias AlbumCompletionBlock = (Album) -> (Void)

protocol AlbumsWireframeInterface: WireframeInterface {
	func willShowUser(album: Album)
	func willChange(user: BehaviorRelay<User>)
}

protocol AlbumsViewInterface: ViewInterface {
	func showSelectedAlbumWith(album: Album)
	func setupLabels()
}

protocol AlbumsPresenterInterface: PresenterInterface {
	var user: BehaviorRelay<User> { get }
	var albums: BehaviorRelay<[Album]> { get }

	func showUserAlbums(completion: @escaping AlbumsCompletionBlock)
	func showAlbumWith(id: Int)
	func show(album: Album)
	func changeUser()
}

protocol AlbumsInteractorInterface: InteractorInterface {
	func getAlbumBy(id: Int, completion: @escaping AlbumCompletionBlock)
	func getAlbumsBy(user: Int, completion: @escaping AlbumsCompletionBlock)
}
