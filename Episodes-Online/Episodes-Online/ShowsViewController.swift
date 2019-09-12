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
  
  var searchString: String = "girls" {
    didSet {
      loadData()
    }
  }
  
  func loadData() {
  let urlString = "http://api.tvmaze.com/search/shows?q=girls"
//    ShowsAPIClient.manager.getShows(completionHandler: {self.shows = $0})
  }


  
  override func viewDidLoad() {
    super.viewDidLoad()
    loadData()
    showsTableView.dataSource = self
    showsTableView.delegate = self
  }


}

extension ShowsViewController: UITableViewDelegate {
}

extension ShowsViewController: UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return shows.count
  }
  
  
  //  THE SHOWS RATING NEEDS TO BE AN OPTIONAL VALUE, THERE IS SOME CASES WHERE A SHOW HAS NOT YET BEEN RATED.  HOW WILL THIS BE HANDLED
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let showResults = shows[indexPath.row]
    let cell = showsTableView.dequeueReusableCell(withIdentifier: "showsCell", for: indexPath) as! ShowsTableViewCell
    cell.showTitleLabel?.text = showResults.shows.name
    cell.showRatingLabel?.text = String(showResults.shows.rating.average)
    return cell
  }
  
  
}
