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
    var filteredData : [Sermon]!
    var secondfilteredData : [Any]!

     
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.register(UINib(nibName: "SearchTableViewCell", bundle: nil), forCellReuseIdentifier: "searchtablecell")
        searchBar.delegate = self
        filteredData = dataReceived
        secondfilteredData = secondDataReceived
        searchTableView.isHidden = false 
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        searchTableView.isHidden = true
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "searchtablecell", for: indexPath) as? SearchTableViewCell{
            cell.configureCell(data: filteredData, index: indexPath)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(150)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        var all_data: [Any] = []
        for data in dataReceived{
            all_data.append(data)
        }
        for sdata in secondDataReceived{
            all_data.append(sdata)
        }
        print("All data:" ,all_data)
        
        if searchText == ""{
            searchTableView.isHidden = true
        }
        else{
            
            searchTableView.isHidden = false
            for sermon in dataReceived{
                if (sermon.title.lowercased()).contains(searchText.lowercased()) || (sermon.preacher.lowercased()).contains(searchText.lowercased()){
                    filteredData.append(sermon)
                    }
                }
        }
        self.searchTableView.reloadData()
    }
    
    
}
