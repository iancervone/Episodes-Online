import Foundation


struct EpisodesAPIClient {

  static let manager = EpisodesAPIClient()
  
  func getEpisodess(completionHandler: @escaping (Result<[Episode], AppError>) -> Void) {
     let episodeURL = "http://api.tvmaze.com/shows/21835/episodes"
     guard let url = URL(string: episodeURL) else {
       completionHandler(.failure(.badURL))
       return
     }
     NetworkHelper.manager.getData(from: url) { result in
       switch result {
       case .failure(let error) :
         completionHandler(.failure(error))
       case .success(let data):
         do {
           let episodeInfo = try JSONDecoder().decode([Episode].self, from: data)
           completionHandler(.success(episodeInfo))
         } catch {
           completionHandler(.failure(.couldNotParseJSON(rawError: error)))
         }
       }
     }
   }

  private init() {}
}



//  func getEpisodes(from search: String, completionHandler: @escaping (Result<Episode, AppError>) -> Void) {
//    guard let episodeURL = URL(string: "http://api.tvmaze.com/shows/21835/episodes") else {
//      fatalError()
//    }
//    NetworkHelper.manager.getData(from: episodeURL) { result in
//      switch result {
//      case .failure(let error):
//        completionHandler(.failure(error))
//        return
//      case .success(let data):
//        do {
//          let episodeInfo = try Episode.getEpisodes(from: data)
//          completionHandler(.success(episodeInfo))
//        }
//        catch {
//          print(error)
//          completionHandler(.failure(.couldNotParseJSON(rawError: error)))
//        }
//      }
//    }
//  }
  
  
  
