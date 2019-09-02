//
//  PhotosWireframe.swift
//  Viper
//
//  Created by Victor Alejandria on 30/08/2019.
//  Copyright (c) 2019 Victor Alejandria. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class PhotosWireframe: BaseWireframe<PhotosViewController> {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "Photos", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: PhotosViewController.self)
        super.init(viewController: moduleViewController)
        
        let interactor = PhotosInteractor()
        let presenter = PhotosPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension PhotosWireframe: PhotosWireframeInterface {
	func willPresentAlbum(id: Int) {
	}
}
