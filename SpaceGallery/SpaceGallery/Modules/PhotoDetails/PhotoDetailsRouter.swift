//
//  PhotoDetailsRouter.swift
//  SpaceGallery
//
//  Created by Nilay Dagdemir on 24.01.2022.
//  
//

import UIKit

class PhotoDetailsRouter {

    // MARK: - Properties
    weak var view: UIViewController?

    // MARK: - Static methods
    /**
     A static method that sets up the related VIPER modules.
     
     - Parameters photoItem: A Photo item to show details on the screen.
    */
    static func setupModule(with photoItem: Photo) -> PhotoDetailsViewController {
        let viewController = UIStoryboard.loadViewController() as PhotoDetailsViewController
        let presenter = PhotoDetailsPresenter()
        let router = PhotoDetailsRouter()

        viewController.presenter =  presenter
        viewController.modalPresentationStyle = .fullScreen

        presenter.view = viewController
        presenter.setPhotoItem(to: photoItem)

        router.view = viewController

        return viewController
    }
}
