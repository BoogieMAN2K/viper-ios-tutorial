//
//  APIServicesProtocol.swift
//  Viper
//
//  Created by Victor Alejandria on 12/09/2019.
//  Copyright © 2019 Victor Alejandria. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

typealias DownloadedImageCompletionBlock = (Data)->(Void)

protocol APIServicesInterfaces {
    func getUsers() -> Driver<[ServicesUser]>
    func getUsersBy(id: Int) -> Driver<ServicesUser>
    func getAlbumsBy(user: Int, completion: @escaping AlbumsCompletionBlock)
    func getAlbumBy(id: Int, completion: @escaping AlbumCompletionBlock)
    func getPhotosBy(album: Int, completion: @escaping PhotosCompletionBlock)
    func downloadImage(url: String, completion: @escaping DownloadedImageCompletionBlock)
}
