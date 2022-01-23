//
//  APIRouter.swift
//  SpaceGallery
//
//  Created by Nilay Dagdemir on 23.01.2022.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {

    case retrievePhotos(page: Int)

    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .retrievePhotos:
            return .get
        }
    }

    // MARK: - Path
    private var path: String {
        switch self {
        case .retrievePhotos:
            return "mars-photos/api/v1/rovers/curiosity/photos"
        }
    }

    // MARK: - baseURL
    private var baseURL: String {
        WSConfig.baseURL
    }

    // MARK: - ParameterEncoding
    private var encoder: ParameterEncoding {
        URLEncoding()
    }

    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .retrievePhotos(let page):
            return ["sol": WSConfig.solValue,
                    "api_key": WSConfig.apiKey,
                    "page": page]
        }
    }

    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {

        // Request URL
        let url = try baseURL.asURL().appendingPathComponent(path).absoluteString.removingPercentEncoding!.asURL()
        var urlRequest = URLRequest(url: url)

        // HTTP Method
        urlRequest.httpMethod = method.rawValue

        // Headers
        urlRequest.setValue(WSConfig.jsonHeader, forHTTPHeaderField: "Content-Type")

        // Parameters
        do {
            urlRequest = try encoder.encode(urlRequest, with: parameters)
        } catch {
            throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
        }
        return urlRequest
    }
}