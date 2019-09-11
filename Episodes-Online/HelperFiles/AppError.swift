//
//  AppError.swift
//  Episodes-Online
//
//  Created by Ian Cervone on 9/11/19.
//  Copyright © 2019 Ian Cervone. All rights reserved.
//

import Foundation

enum AppError: Error {
  case unauthenticated
  case invalidJSONResponse
  case couldNotParseJSON(rawError: Error)
  case noInternetConnection
  case badURL
  case badStatusCode
  case noDataReceived
  case notAnImage
  case other(rawError: Error)
}
