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
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 190
  }
  
//  func loadData() {
////    let urlString = "http://api.tvmaze.com/search/shows?q=girls"
//    ShowsAPIClient.manager.getShows(completionHandler: <#T##(Result<[Show], AppError>) -> Void#>)
//
  
  func loadData() {
      ShowsAPIClient.manager.getShows { (result) in
        DispatchQueue.main.async { [weak self] in
          switch result {
          case let .success(shows):
            self?.shows = shows
          case let .failure(error):
            self?.displayErrorAlert(with: error)
          }
        }
      }
    }
  
  func displayErrorAlert(with error: AppError) {
    let alertVC = UIAlertController(title: "Error Fetching Data", message: "\(error)", preferredStyle: .alert)
    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
    present(alertVC, animated: true, completion: nil)
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
    cell.showTitleLabel?.text = showResults.shows?.name
    cell.showRatingLabel?.text = showResults.shows?.rating.average.description
    return cell
  }
  
  
}
