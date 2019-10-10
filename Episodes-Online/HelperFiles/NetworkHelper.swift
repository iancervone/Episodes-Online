//
//  NetworkHelper.swift
//  Episodes-Online
//
//  Created by Ian Cervone on 9/11/19.
//  Copyright © 2019 Ian Cervone. All rights reserved.
//

import Foundation

class NetworkHelper {
  static let manager = NetworkHelper()

  func getData(from url: URL,
               completionHandler: @escaping ((Result<Data, AppError>) -> Void)) {
    self.urlSession.dataTask(with: url) { (data, response, error) in
      DispatchQueue.main.async {
        guard let data = data else {
          completionHandler(.failure(.noDataReceived))
          return
        }
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
          completionHandler(.failure(.badStatusCode))
          return
        }

        if let error = error {
          let error = error as NSError
          if error.domain == NSURLErrorDomain && error.code == NSURLErrorNotConnectedToInternet {
            completionHandler(.failure(.noInternetConnection))
            return
          } else {
            completionHandler(.failure(.other(rawError: error)))
            return
          }
        }
        completionHandler(.success(data))
      }
      }.resume()
  }

  private init() {}

  private let urlSession = URLSession(configuration: URLSessionConfiguration.default)
}








//class NetworkHelper {
//
//  // TODO: update this to cache
//  private init() {}
//
//  /// singleton
//  static let shared = NetworkHelper()
//
//  //Performs GET requests for any URL
//  //Parameters: URL as a string
//  //Completion: Result with Data in success, AppError in failure
//
//  func fetchData(urlString: String,  completionHandler: @escaping (Result<Data,AppError>) -> ()) {
//    guard let url = URL(string: urlString) else {
//      completionHandler(.failure(.badUrl))
//      return
//    }
//
//    URLSession.shared.dataTask(with: url) { (data, response, error) in
//      guard error == nil else {
//        completionHandler(.failure(.networkError))
//        return
//      }
//
//      guard let data = data else {
//        completionHandler(.failure(.noDataError))
//        return
//      }
//
//      guard let response = response as? HTTPURLResponse else {
//        completionHandler(.failure(.badHTTPResponse))
//        return
//      }
//
//      switch response.statusCode {
//      case 404:
//        completionHandler(.failure(.notFound))
//      case 401,403:
//        completionHandler(.failure(.unauthorized))
//      case 200...299:
//        completionHandler(.success(data))
//      default:
//        completionHandler(.failure(.other(errorDescription: "Wrong Status Code")))
//      }
//      }.resume()
//  }
//
//}

