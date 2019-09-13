//
//  ShowsModel.swift
//  Episodes-Online
//
//  Created by Ian Cervone on 9/11/19.
//  Copyright © 2019 Ian Cervone. All rights reserved.
//

import Foundation
import UIKit

struct ShowResponse: Codable {
  let shows: Show?
  
  private enum CodingKeys: String, CodingKey {
    case shows = "show"
  }
}

struct Show: Codable {
  let name: String
  let rating: Rating
  let image: Image?
  
  static func getShows(from jsonData: Data) throws -> [ShowResponse] {
    let response = try JSONDecoder().decode([ShowResponse].self, from: jsonData)
    return response
  }
}

struct Rating: Codable {
  let average: Double?
}

struct Image: Codable {
  let medium: String
  let original: String
}
