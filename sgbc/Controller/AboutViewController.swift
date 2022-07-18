//
//  AboutViewController.swift
//  sgbc
//
//  Created by ADMIN on 13/07/2022.
//

import UIKit

class AboutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var aboutHeaderImageView: UIImageView!
    @IBOutlet weak var AboutTableView: UITableView!
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    let info = NewsData().getNews()
    override func viewDidLoad() {
        super.viewDidLoad()
        AboutTableView.delegate = self
        AboutTableView.dataSource = self
        AboutTableView.register(UINib(nibName: "AboutTableViewCell", bundle: nil), forCellReuseIdentifier: "AboutCellIdentifier")
        aboutHeaderImageView.image = UIImage(named: "d")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = true 
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AboutCellIdentifier", for: indexPath) as? AboutTableViewCell{
            cell.configureCell(with: info, atIndex: indexPath)
            return cell // check this to ensure different messages for the different headers 
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return info.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return info[section].topic // create an array for the headers later
    }
    
   
    
    

}
