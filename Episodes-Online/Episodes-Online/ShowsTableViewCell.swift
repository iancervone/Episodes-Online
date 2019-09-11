//
//  ShowsTableViewCell.swift
//  Episodes-Online
//
//  Created by Ian Cervone on 9/11/19.
//  Copyright © 2019 Ian Cervone. All rights reserved.
//

import UIKit

class ShowsTableViewCell: UITableViewCell {

  @IBOutlet weak var showImage: UIImageView!
  @IBOutlet weak var showTitleLabel: UILabel!
  @IBOutlet weak var showRatingLabel: UILabel!
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
