//
//  WelcomeViewController.swift
//  sgbc
//
//  Created by ADMIN on 12/07/2022.
//

import UIKit

class WelcomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    let categoryData: [String] = HomeData().getHomeCategories()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeCellIdentifier")
        tableView.delegate = self
        tableView.dataSource = self
        navigationController?.navigationBar.isHidden = true
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCellIdentifier", for: indexPath) as? HomeTableViewCell{
            cell.configureCell(with: categoryData, atIndex: indexPath)
            return cell
        }        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(160)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let cell = tableView.cellForRow(at: indexPath) as? HomeTableViewCell {
            if cell.categoryLabel.text == "About SGBC"{
                performSegue(withIdentifier: "aboutIdentifier", sender: self)
            }
            else if cell.categoryLabel.text == "SGBC'S Leadership"{
                performSegue(withIdentifier: "leadershipidentifier", sender: self)
            }
            else if cell.categoryLabel.text == "Ministries"{
                performSegue(withIdentifier: "ministriesIdentifier", sender: self)
            }
        }
    }
    


}

// To remove keyboard especially from the searchViewController 
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
