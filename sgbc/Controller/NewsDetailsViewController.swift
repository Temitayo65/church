//
//  NewsDetailsViewController.swift
//  sgbc
//
//  Created by ADMIN on 14/07/2022.
//

import UIKit

class NewsDetailsViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    

    @IBOutlet weak var NewsDetailsTableView: UITableView!
    var newsdetails: News = News(topic: "", imageName: "", newsContent: "", date: "")
    var headerSent: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        NewsDetailsTableView.delegate = self
        NewsDetailsTableView.dataSource = self
        NewsDetailsTableView.register(UINib(nibName: "NewsDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "newsdetailscellidentifier")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        tabBarController?.tabBar.isHidden = false
        
    }
    func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "newsdetailscellidentifier", for: indexPath) as? NewsDetailsTableViewCell{
            cell.configureCell(with: newsdetails)
            return cell 
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(900)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {     
        return headerSent
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }


}
