//
//  ViewController.swift
//  Episodes-Online
//
//  Created by Ian Cervone on 9/11/19.
//  Copyright © 2019 Ian Cervone. All rights reserved.
//

import UIKit

class ShowsViewController: UIViewController {

  @IBOutlet weak var showsSearchBar: UISearchBar!
  @IBOutlet weak var showsTableView: UITableView!
  
  
  var shows = [ShowResponse]() {
      didSet {
        showsTableView.reloadData()
      }
    }
  
  var searchString: String = "" {
    didSet {
      loadData()
    }
  }
  
  func loadData() {
  let urlString = "http://api.tvmaze.com/search/shows?q=\(searchString)"
//    ShowsAPIClient.manager.getShows(from: urlString, completionHandler: {self.shows = $0}, errorHandler: {print($0)})
  }

  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }


}



