//
//  MediaViewController.swift
//  sgbc
//
//  Created by ADMIN on 13/07/2022.
//

import UIKit

class MediaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let mediaCategoryData = HomeData().getMeidaCategories()
    @IBOutlet weak var MediaTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MediaTableView.delegate = self
        MediaTableView.dataSource = self
        MediaTableView.register(UINib(nibName: "MediaTableViewCell", bundle: nil), forCellReuseIdentifier: "MediaTableIdentifier")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mediaCategoryData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MediaTableIdentifier", for: indexPath) as? MediaTableViewCell {
            cell.configureCell(with: mediaCategoryData, atIndex: indexPath)
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(160)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let cell = tableView.cellForRow(at: indexPath) as? MediaTableViewCell {
            if cell.categoryLabel.text == "Sermon"{
                performSegue(withIdentifier: "SermonIdentifier", sender: self)
            }
            /*
            else if cell.categoryLabel.text == "Podcast"{
                performSegue(withIdentifier: "", sender: self)
            }
            else if cell.categoryLabel.text == "Radio"{
                performSegue(withIdentifier: "", sender: self)
            }
            else if cell.categoryLabel.text == "Blog"{
                performSegue(withIdentifier: "", sender: self)
            }
            // To fill the above with their respective cell identifiers
            */
        }
        

    }

}
