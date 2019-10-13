
import Foundation

struct Episode: Codable {
  let id: Int
  let name: String
  let season: Int
  let number: Int
  let image: ImageWrapper?
  let summary: String?
}

struct ImageWrapper: Codable {
  let medium: String
  let original: String
}




  

////FUNCTION
//
//extension Episode: Images {
//  var imageName: String {
//    return mediumImageID
//  }
//
//  func getImage() -> UIImage {
//    return UIImage(named: imageName)!
//  }
//
//}
//
//
//
//
//
//
////PROTOCOL
//
//protocol Images {
//  var imageName: String{get}
//  func getImage() -> UIImage
//}
