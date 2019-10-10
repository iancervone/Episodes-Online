//
//  ImageHelper.swift
//  Episodes-Online
//
//  Created by Ian Cervone on 9/13/19.
//  Copyright © 2019 Ian Cervone. All rights reserved.
//

import Foundation
import UIKit

class ImageHelper {
  // Singleton instance to have only one instance in the app of the imageCache
  private init() {}
  static let shared = ImageHelper()
  
  func fetchImage(urlString: String, completionHandler: @escaping (Result<UIImage,AppError>) -> ()) {
    NetworkHelper.manager.getData(from: showsURL) { (result) in
      switch result {
      case .failure(let error):
        completionHandler(.failure(error))
      case .success(let data):
        guard let image = UIImage(data: data) else {completionHandler(.failure(.badImageData))
          return
        }
        completionHandler(.success(image))
      }
    }
  }
}
