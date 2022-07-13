//
//  MinistriesViewController.swift
//  sgbc
//
//  Created by ADMIN on 13/07/2022.
//

import UIKit

class MinistriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var ministriesBackgroundImageView: UIImageView!
    @IBOutlet weak var ministriesTableView: UITableView!
    
    let ministries = HomeData().getMinistriesCategories()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ministriesTableView.delegate = self
        ministriesTableView.dataSource = self
        ministriesTableView.register(UINib(nibName: "MinistriesTableViewCell", bundle: nil), forCellReuseIdentifier: "ministriesCellIdentifier")
        ministriesBackgroundImageView.image = UIImage(named: "i")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ministries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ministriesCellIdentifier", for: indexPath) as? MinistriesTableViewCell{
            cell.configureCell(with: ministries, atIndex: indexPath)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(200)
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    


}
