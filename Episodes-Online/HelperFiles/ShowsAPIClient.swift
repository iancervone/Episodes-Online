//
//  ShowsAPIClient.swift
//  Episodes-Online
//
//  Created by Ian Cervone on 9/11/19.
//  Copyright © 2019 Ian Cervone. All rights reserved.
//
import Foundation


struct ShowsAPIClient {

  static let manager = ShowsAPIClient()
//  let showsURL = "http://api.tvmaze.com/search/shows?q=girls"

  func getShows(from search: String, completionHandler: @escaping (Result<[ShowResponse], AppError>) -> Void) {
    guard let showURL = URL(string: "https://api.tvmaze.com/search/shows?q=\(search)") else {
      fatalError()
    }
    NetworkHelper.manager.getData(from: showURL) { result in
      switch result {
      case .failure(let error):
        completionHandler(.failure(error))
        return
      case .success(let data):
        do {
          let showInfo = try Show.getShows(from: data)
          completionHandler(.success(showInfo))
        }
        catch {
          print(error)
          completionHandler(.failure(.couldNotParseJSON(rawError: error)))

        }
      }
    }
  }

  

  private init() {}
}


//var showsURL: URL {
//  guard let url = URL(string: "https://api.tvmaze.com/search/shows?q=girls") else {
//    fatalError("Error: Invalid URL")
//  }
//  return url
//}






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


