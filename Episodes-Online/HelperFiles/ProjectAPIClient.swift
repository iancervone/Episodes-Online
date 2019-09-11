//
//  ProjectAPIClient.swift
//  Episodes-Online
//
//  Created by Ian Cervone on 9/11/19.
//  Copyright © 2019 Ian Cervone. All rights reserved.
//

import Foundation

struct ProjectAPIClient {
  
  // MARK: - Static Properties
  
  static let manager = ProjectAPIClient()
  
  // MARK: - Internal Methods
  
  func getProjects(completionHandler: @escaping (Result<[Project], AppError>) -> Void) {
    NetworkHelper.manager.getData(from: showsURL) { result in
      switch result {
      case let .failure(error):
        completionHandler(.failure(error))
        return
      case let .success(data):
        do {
          let projects = try Project.getProjects(from: data)
          completionHandler(.success(projects))
        }
        catch {
          completionHandler(.failure(.couldNotParseJSON(rawError: error)))
        }
      }
    }
  }
  
  // MARK: - Private Properties and Initializers
  
  private var showsURL: URL {
    guard let url = URL(string: "http://api.tvmaze.com/search/shows?q=\(SEARCHSTRING)") else {
      fatalError("Error: Invalid URL")
    }
    return url
  }
  
  private init() {}
}
