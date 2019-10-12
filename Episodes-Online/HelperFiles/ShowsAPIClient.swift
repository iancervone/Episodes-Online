import Foundation


struct ShowsAPIClient {

  static let manager = ShowsAPIClient()

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
