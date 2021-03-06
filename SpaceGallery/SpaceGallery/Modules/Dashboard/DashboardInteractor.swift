//
//  DashboardInteractor.swift
//  SpaceGallery
//
//  Created by Nilay Dagdemir on 23.01.2022.
//  
//

import Foundation

class DashboardInteractor {

    // MARK: Properties
    weak var output: IDashboardInteractorToPresenter?
    var apiClient: APIClientInterface?
}

extension DashboardInteractor: IDashboardInteractor {
    /**
     Retrieve photos with given page number and filter option from the NASA API.
     
     - Parameters pageNumber: An integer that represents the page number to retrieve.
     - Parameters filterOption: A FilterOption object that represents the filter type to filter.
    */
    func retrievePhotos(from pageNumber: Int, with filterOption: FilterOption) {
        apiClient?.retrievePhotos(page: pageNumber,
                                  with: filterOption.rawValue,
                                  onSuccess: { [weak self] response in
            guard let self = self else { return }
            if let photos = response.results?.photos {
                self.output?.photosReceived(photos)
            } else {
                self.output?.wsErrorOccurred(with: Constants.Error.defaultErrorMessage)
            }
        }, onError: { [weak self] (error) in
            guard let self = self else { return }
            self.output?.wsErrorOccurred(with: error?.message ?? Constants.Error.defaultErrorMessage)
        })
    }
}
