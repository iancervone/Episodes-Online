//
//  ShowsModel.swift
//  Episodes-Online
//
//  Created by Ian Cervone on 9/11/19.
//  Copyright © 2019 Ian Cervone. All rights reserved.
//

import Foundation

struct ShowResponse: Codable {
  let shows: Show
}

struct Show: Codable {
  let name: String
  let rating: Rating
  let image: Image
  
  static func getShows(from jsonData: Data) throws -> [Show] {
    let response = try JSONDecoder().decode(ShowResponse.self, from: jsonData)
    return [response.shows].self
  }
}

struct Rating: Codable {
  let average: Double
}

struct Image: Codable {
  let medium: String
  let original: String
}
