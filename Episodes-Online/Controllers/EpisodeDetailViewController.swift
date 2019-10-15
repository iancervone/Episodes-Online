
import UIKit

class EpisodeDetailViewController: UIViewController {

  @IBOutlet weak var sNameLabel: UILabel!
  @IBOutlet weak var eNumberLabel: UILabel!
  @IBOutlet weak var eNameLabel: UILabel!
  @IBOutlet weak var eSummaryLabel: UILabel!
  
  @IBOutlet weak var eDetailImageView: UIImageView!
  
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
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
    eSummaryLabel.text = selectedEpisode.summary?.replacingOccurrences(of: "<p>", with: "").replacingOccurrences(of: "</p>", with: "")
    setImage()
  }
    

  func setImage() {
      
    if let detailImage = selectedEpisode.image?.original {
      activityIndicator.startAnimating()
      ImageHelper.shared.getImage(urlStr: selectedEpisode.image!.original) { (result) in
              DispatchQueue.main.async {
                  switch result {
                  case .failure(let error):
                    self.activityIndicator.stopAnimating()
                      print(error)
                  case .success(let image):
                    self.activityIndicator.stopAnimating()
                  self.eDetailImageView.image = image
                  }
              }
          }
          
      }
      
      eDetailImageView.image = UIImage(named: "noImage")
  }
  
}
