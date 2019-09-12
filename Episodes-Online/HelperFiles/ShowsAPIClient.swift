//
//  ShowsAPIClient.swift
//  Episodes-Online
//
//  Created by Ian Cervone on 9/11/19.
//  Copyright © 2019 Ian Cervone. All rights reserved.
//
import Foundation

//enum BenResult<Success, Failure:Error> {
//  case success(Success)
//  case failure(Failure)
//}
//
//
//struct ShowsAPIClient {
//  static var shared = ShowsAPIClient()
//  let showsURL = "http://api.tvmaze.com/search/shows?q=girls"
//
//  func getShows(completion:@escaping (Result<Shows, AppError>) -> ()) {
//    guard let url = URL(string: showsURL) else { return }
//    URLSession.shared.dataTask(with: url) {(data, response, err) in
//      //Error handler
//      if let err = err {
//        completion(.failure(err))
//      }
//      //success
//      do {
//        let shows = try JSONDecoder().decode(Shows.self, from: data!)
//        completion(.success(shows))
//      }
//      catch let jsonError {
//        completion(.failure(AppError.jsonError))
//      }
//      }.resume()
//  }
//}





struct ShowsAPIClient {

  static let manager = ShowsAPIClient()
//  let showsURL = "http://api.tvmaze.com/search/shows?q=girls"

  func getShows(completionHandler: @escaping (Result<[Show], AppError>) -> Void) {
    NetworkHelper.manager.getData(from: showsURL) { result in
      switch result {
      case let .failure(error):
        completionHandler(.failure(error))
        return
      case let .success(data):
        do {
          let shows = try Show.getShows(from: data)
          completionHandler(.success(shows))
        }
        catch {
          completionHandler(.failure(.couldNotParseJSON(rawError: error)))

        }
      }
    }
  }

  // MARK: - Private Properties and Initializers

  private var showsURL: URL {
    guard let url = URL(string: "http://api.tvmaze.com/search/shows?q=girls") else {
      fatalError("Error: Invalid URL")
    }
    return url
  }

  private init() {}
}









