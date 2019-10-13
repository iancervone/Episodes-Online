
import UIKit

class EpisodeDetailViewController: UIViewController {

  @IBOutlet weak var sNameLabel: UILabel!
  @IBOutlet weak var eNumberLabel: UILabel!
  @IBOutlet weak var eNameLabel: UILabel!
  @IBOutlet weak var eSummaryLabel: UILabel!
  
  @IBOutlet weak var eDetailImageView: UIImageView!
  
  var selectedEpisode: Episode!
  
  var showName = String()
  
  
  
  override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
  private func setUpViews() {
    sNameLabel.text = showName
    eNumberLabel.text = "season: \(selectedEpisode.season) episode: \(selectedEpisode.number)"
    eNameLabel.text = selectedEpisode.name
    eSummaryLabel.text = selectedEpisode.summary?
  }
    

}
