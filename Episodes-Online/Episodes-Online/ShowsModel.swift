//
//  ShowsModel.swift
//  Episodes-Online
//
//  Created by Ian Cervone on 9/11/19.
//  Copyright © 2019 Ian Cervone. All rights reserved.
//

import Foundation

struct Show: Codable {
  let name: String
  let rating: Rating
  let image: Image
}

struct Rating: Codable {
  let average: Double
}

struct Image: Codable {
  let medium: String
  let original: String
}
