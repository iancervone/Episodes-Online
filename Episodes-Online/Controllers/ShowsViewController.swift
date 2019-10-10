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
  
  var searchString: String? = nil {
    didSet {
      showsTableView.reloadData()
      loadData()
    }
  }
    
  override func viewDidLoad() {
    super.viewDidLoad()
    showsTableView.dataSource = self
    showsTableView.delegate = self
    showsSearchBar.delegate = self
    loadData()
  }

  private func loadData() {
    ShowsAPIClient.manager.getShows(from: searchString ?? "girls") { (result) in
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
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 300
  }
  
}


extension ShowsViewController: UITableViewDelegate, UITableViewDataSource{
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return shows.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let showResults = shows[indexPath.row]
    let cell = showsTableView.dequeueReusableCell(withIdentifier: "showsCell", for: indexPath) as! ShowsTableViewCell
    cell.showTitleLabel?.text = showResults.shows?.name
    cell.showRatingLabel?.text = showResults.shows?.rating.average?.description
    return cell
  }
}


extension ShowsViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    searchString = searchBar.text?.lowercased().replacingOccurrences(of: " ", with: "+")
    
    loadData()
  }
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    showsSearchBar.resignFirstResponder()
  }
  
}
