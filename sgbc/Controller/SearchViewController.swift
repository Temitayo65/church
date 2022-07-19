//
//  SearchViewController.swift
//  sgbc
//
//  Created by ADMIN on 18/07/2022.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
  
    

    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var dataReceived : [Sermon] = SermonData().getSermon()
    var secondDataReceived : [Podcast] = PodcastData().getPodcasts()
    var secondfilteredData : [Any]!
    var all_data: [Any] = []
    var searchBarIsEmpty = true

     
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.register(UINib(nibName: "SearchTableViewCell", bundle: nil), forCellReuseIdentifier: "searchtablecell")
        searchBar.delegate = self
        secondfilteredData = all_data
        searchTableView.isHidden = false
        self.searchTableView.keyboardDismissMode = .onDrag
        self.hideKeyboardWhenTappedAround()
       
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        searchTableView.isHidden = true
        // This helps to hide show the tableview when the navigationbar is on another screen
        // and the search bar still contains some text that show that the search is still on
        if !searchBarIsEmpty{
            searchTableView.isHidden = false
        }
        else{
            searchTableView.isHidden = true
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return secondfilteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "searchtablecell", for: indexPath) as? SearchTableViewCell{
            // cell.configureCell(data: filteredData, index: indexPath)
            cell.configurecell(data: secondfilteredData, index: indexPath)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(150)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        secondfilteredData = []
        var all_data: [Any] = []
        for data in dataReceived{
            all_data.append(data)
        }
        for sdata in secondDataReceived{
            all_data.append(sdata)
        }
        
        if searchText == ""{
            searchBarIsEmpty = true
            searchTableView.isHidden = true
            // tabBarController?.tabBar.isHidden = false
        }
        else{
            // tabBarController?.tabBar.isHidden = true
            searchTableView.isHidden = false
            searchBarIsEmpty = false
            for item in all_data{
                if item is Sermon{
                    let gottenItem = item as! Sermon
                    if gottenItem.title.lowercased().contains(searchText.lowercased()) || gottenItem.preacher.lowercased().contains(searchText.lowercased()) {
                        secondfilteredData.append(gottenItem)
                    }
                        
                }
                else if item is Podcast{
                    let gottenItem = item as! Podcast
                    if gottenItem.podcastTitle.lowercased().contains(searchText.lowercased()) || gottenItem.episode!.lowercased().contains(searchText.lowercased()){
                        secondfilteredData.append(gottenItem)
                    }
                                        
                }
            }

        }
        self.searchTableView.reloadData()
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
   
  
    
}
