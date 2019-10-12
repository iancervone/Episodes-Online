
import UIKit

class EpisodesTableViewCell: UITableViewCell {

  
  @IBOutlet weak var episodeNameLabel: UILabel!
  
  
  @IBOutlet weak var episodeNumLabel: UILabel!
  
  @IBOutlet weak var episodeImageView: UIImageView!
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
