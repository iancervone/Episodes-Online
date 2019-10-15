import Foundation


struct EpisodesAPIClient {

  static let manager = EpisodesAPIClient()
  
  func getEpisodes(from id: String, completionHandler: @escaping (Result<[Episode], AppError>) -> Void) {
     let episodeURL = "http://api.tvmaze.com/shows/\(id)/episodes"
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

