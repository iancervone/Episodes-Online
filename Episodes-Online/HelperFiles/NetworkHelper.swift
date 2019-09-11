//
//  NetworkHelper.swift
//  Episodes-Online
//
//  Created by Ian Cervone on 9/11/19.
//  Copyright © 2019 Ian Cervone. All rights reserved.
//

import Foundation

//CODE BELOW WAS ADDED BUT HAS NOT BEEN

class NetworkHelper {
  
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
