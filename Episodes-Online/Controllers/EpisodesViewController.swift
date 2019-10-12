

import UIKit

class EpisodesViewController: UIViewController {
  
  
  @IBOutlet weak var showNameLabel: UILabel!
  
  @IBOutlet weak var episodeTableView: UITableView!
  
  var selectedShow: ShowResponse!
   

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
