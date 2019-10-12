

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
        setUpViews()
    }
  

  
  private func setUpViews() {
    showNameLabel.text = selectedShow.shows?.name
  }
}

extension EpisodesViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return showsEpisodes.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = episodeTableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath) as? EpisodesTableViewCell else {
      return UITableViewCell()
    }
    let episode = showsEpisodes[indexPath.row]
    cell.episodeNameLabel.text = episode.name
    cell.episodeNumLabel.text = "easson \(episode.season) : episode \(episode.number)"
    return cell
  }
  
  
}
