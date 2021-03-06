//
//  DashboardRequestStubs.swift
//  SpaceGallery
//
//  Created by Nilay Dagdemir on 26.01.2022.
//

import OHHTTPStubs
import OHHTTPStubsSwift

class RetrieveCuriosityPhotosRequestStubs: StubHelperProtocol {
    static let shared: StubHelperProtocol = RetrieveCuriosityPhotosRequestStubs()
    var stubName: String = "retrieveCuriosityPhotosRequestStubs"
    weak var retrieveCuriosityPhotosRequestStubs: HTTPStubsDescriptor?

    private let router = APIRouter.retrievePhotos(page: 1, filterOption: FilterOption.curiosity.rawValue)

    func loadStubs() {
        self.unloadStubs()
        guard let urlRequest = try? router.asURLRequest() else { return }
        retrieveCuriosityPhotosRequestStubs = HTTPStubs().stub(request: urlRequest) { _ in
            guard let stubPath = OHPathForFile("curiosityPhotos.json",
                                               type(of: self)) else { return
                HTTPStubsResponse()
            }
            return fixture(filePath: stubPath, headers: ["Content-Type" as NSObject: "application/json" as AnyObject])
        }
        retrieveCuriosityPhotosRequestStubs?.name = stubName
    }

    func loadFailStubs() {
        self.unloadStubs()
        guard let urlRequest = try? router.asURLRequest() else { return }
        retrieveCuriosityPhotosRequestStubs = HTTPStubs().stub(request: urlRequest) { _ in
            let notConnectedError = NSError(domain: NSURLErrorDomain, code: URLError.badServerResponse.rawValue)
            return HTTPStubsResponse(error: notConnectedError)
        }
        retrieveCuriosityPhotosRequestStubs?.name = stubName
    }

    func unloadStubs() {
        guard let retrieveCuriosityPhotosRequestStubs = self.retrieveCuriosityPhotosRequestStubs else { return }
        HTTPStubs.removeStub(retrieveCuriosityPhotosRequestStubs)
    }
}

class RetrieveOpportunityPhotosRequestStubs: StubHelperProtocol {
    static let shared: StubHelperProtocol = RetrieveOpportunityPhotosRequestStubs()
    var stubName: String = "retrieveOpportunityPhotosRequestStubs"
    weak var retrieveOpportunityPhotosRequestStubs: HTTPStubsDescriptor?

    private let router = APIRouter.retrievePhotos(page: 1, filterOption: FilterOption.opportunity.rawValue)

    func loadStubs() {
        self.unloadStubs()
        guard let urlRequest = try? router.asURLRequest() else { return }
        retrieveOpportunityPhotosRequestStubs = HTTPStubs().stub(request: urlRequest) { _ in
            guard let stubPath = OHPathForFile("opportunityPhotos.json",
                                               type(of: self)) else { return
                HTTPStubsResponse()
            }
            return fixture(filePath: stubPath, headers: ["Content-Type" as NSObject: "application/json" as AnyObject])
        }
        retrieveOpportunityPhotosRequestStubs?.name = stubName
    }

    func loadFailStubs() {
        self.unloadStubs()
        guard let urlRequest = try? router.asURLRequest() else { return }
        retrieveOpportunityPhotosRequestStubs = HTTPStubs().stub(request: urlRequest) { _ in
            let notConnectedError = NSError(domain: NSURLErrorDomain, code: URLError.badServerResponse.rawValue)
            return HTTPStubsResponse(error: notConnectedError)
        }
        retrieveOpportunityPhotosRequestStubs?.name = stubName
    }

    func unloadStubs() {
        guard let retrieveOpportunityPhotosRequestStubs = self.retrieveOpportunityPhotosRequestStubs else { return }
        HTTPStubs.removeStub(retrieveOpportunityPhotosRequestStubs)
    }
}

class RetrieveSpiritPhotosRequestStubs: StubHelperProtocol {
    static let shared: StubHelperProtocol = RetrieveSpiritPhotosRequestStubs()
    var stubName: String = "retrieveSpiritPhotosRequestStubs"
    weak var retrieveSpiritPhotosRequestStubs: HTTPStubsDescriptor?

    private let router = APIRouter.retrievePhotos(page: 1, filterOption: FilterOption.spirit.rawValue)

    func loadStubs() {
        self.unloadStubs()
        guard let urlRequest = try? router.asURLRequest() else { return }
        retrieveSpiritPhotosRequestStubs = HTTPStubs().stub(request: urlRequest) { _ in
            guard let stubPath = OHPathForFile("spiritPhotos.json",
                                               type(of: self)) else { return
                HTTPStubsResponse()
            }
            return fixture(filePath: stubPath, headers: ["Content-Type" as NSObject: "application/json" as AnyObject])
        }
        retrieveSpiritPhotosRequestStubs?.name = stubName
    }

    func loadFailStubs() {
        self.unloadStubs()
        guard let urlRequest = try? router.asURLRequest() else { return }
        retrieveSpiritPhotosRequestStubs = HTTPStubs().stub(request: urlRequest) { _ in
            let notConnectedError = NSError(domain: NSURLErrorDomain, code: URLError.badServerResponse.rawValue)
            return HTTPStubsResponse(error: notConnectedError)
        }
        retrieveSpiritPhotosRequestStubs?.name = stubName
    }

    func unloadStubs() {
        guard let retrieveSpiritPhotosRequestStubs = self.retrieveSpiritPhotosRequestStubs else { return }
        HTTPStubs.removeStub(retrieveSpiritPhotosRequestStubs)
    }
}
