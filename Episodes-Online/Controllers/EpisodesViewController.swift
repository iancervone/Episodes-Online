

import UIKit

class EpisodesViewController: UIViewController {
  
  @IBOutlet weak var showNameLabel: UILabel!
  @IBOutlet weak var episodeTableView: UITableView!
  
  var selectedShow: ShowResponse!
  
  var showsEpisodes = [Episode]() {
    didSet {
      episodeTableView.reloadData()
    }
  }
  
  
  
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
        episodeTableView.delegate = self
        episodeTableView.dataSource = self
        setUpViews()
        loadData()
    }
  
  private func loadData() {
    EpisodesAPIClient.manager.getEpisodes(from: "\(selectedShow.shows!.id)", completionHandler: {(result) in
   DispatchQueue.main.async {
          switch result {
          case .success(let episodesFromOnline):
            self.showsEpisodes = episodesFromOnline
          case .failure(let error):
            print(error)
          }
        }
      })
  }
    
    
//    getEpisodes(from: "\(selectedShow.shows?.id)") { (result) in
//      DispatchQueue.main.async { [weak self] in
//        switch result {
//        case let .success(shows):
//          self?.shows = shows
//        case let .failure(error):
//          self?.displayErrorAlert(with: error)
//        }
//      }
//    }
//  }
  
  private func setUpViews() {
    showNameLabel.text = selectedShow.shows?.name
  }
  
  
  
  
}

extension EpisodesViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return showsEpisodes.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = episodeTableView.dequeueReusableCell(withIdentifier: "episodesCell", for: indexPath) as? EpisodesTableViewCell else {
      return UITableViewCell()
    }
    let episode = showsEpisodes[indexPath.row]
    cell.episodeNameLabel.text = episode.name
    cell.episodeNumLabel.text = "season \(episode.season) : episode \(episode.number)"
    return cell
  }
  
  
}
