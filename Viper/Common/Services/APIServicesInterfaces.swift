//
//  APIServicesProtocol.swift
//  Viper
//
//  Created by Victor Alejandria on 12/09/2019.
//  Copyright © 2019 Victor Alejandria. All rights reserved.
//

import Foundation

typealias DownloadedImageCompletionBlock = (Data)->(Void)

protocol APIServicesInterfaces {
    func getUsers(completion: @escaping UsersCompletionBlock)
    func getUsersBy(id: Int, completion: @escaping UserCompletionBlock)
    func getAlbumsBy(user: Int, completion: @escaping AlbumsCompletionBlock)
    func getAlbumBy(id: Int, completion: @escaping AlbumCompletionBlock)
    func getPhotosBy(album: Int, completion: @escaping PhotosCompletionBlock)
    func downloadImage(url: String, completion: @escaping DownloadedImageCompletionBlock)
}
