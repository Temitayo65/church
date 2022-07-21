//
//  NewsViewController.swift
//  sgbc
//
//  Created by ADMIN on 13/07/2022.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let newsData: [News] = NewsData().getNews()
    var headerSent: String = ""
    var newsToBeSent: News = News(topic: "", imageName: "", newsContent: "", date: "")
    
    @IBOutlet weak var newsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsCellIdentifier")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.navigationBar.isHidden = false
        let backBarButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButton
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCellIdentifier", for: indexPath) as? NewsTableViewCell{
            cell.configureCell(with: newsData, atIndex: indexPath)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(180)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newsdetailsidentifier" {
            let newsDetailsVC = segue.destination as! NewsDetailsViewController
            newsDetailsVC.headerSent = headerSent
            newsDetailsVC.newsdetails = newsToBeSent
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            headerSent = newsData[indexPath.row].topic
            newsToBeSent = newsData[indexPath.row]
            performSegue(withIdentifier: "newsdetailsidentifier", sender: self)
    }
    
    
}
