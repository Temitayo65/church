//
//  ViewController.swift
//  sgbc
//
//  Created by ADMIN on 11/07/2022.
//

import UIKit

class SermonViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var sermonTableView: UITableView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var topViewImage: UIImageView!
    @IBOutlet weak var recentsButton: UIButton!
    @IBOutlet weak var seriesButton: UIButton!
    @IBOutlet weak var booksButton: UIButton!
    @IBOutlet weak var speakersButton: UIButton!
    
    let sermons = SermonData().getSermon()
    var sermonUpdate = Sermon()
    var whiteColorValues = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        sermonTableView.delegate = self
        sermonTableView.dataSource = self
        sermonTableView.register(UINib(nibName: "SermonTableViewCell", bundle: nil), forCellReuseIdentifier: "SermonIdentifier")
        sermonTableView.separatorStyle = .none
        sermonTableView.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        setButtonProperty(buttonName: recentsButton, borderColor: whiteColorValues, borderWidth: 1.0, cornerRadius: 4.0)
        setButtonProperty(buttonName: seriesButton, borderColor: whiteColorValues, borderWidth: 1.0, cornerRadius: 4.0)
        setButtonProperty(buttonName: booksButton, borderColor: whiteColorValues, borderWidth: 1.0, cornerRadius: 4.0)
        setButtonProperty(buttonName: speakersButton, borderColor: whiteColorValues, borderWidth: 1.0, cornerRadius: 4.0)
    }
    
    func setButtonProperty(buttonName: UIButton, borderColor: CGColor, borderWidth: CGFloat, cornerRadius: CGFloat){
        buttonName.layer.borderColor = borderColor
        buttonName.layer.borderWidth = borderWidth
        buttonName.layer.cornerRadius = cornerRadius
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = true 
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
        tabBarController?.tabBar.isHidden = false
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sermons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = sermonTableView.dequeueReusableCell(withIdentifier: "SermonIdentifier", for: indexPath) as? SermonTableViewCell{
            cell.configureCell(with: sermons, atIndex: indexPath)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sermonUpdate = Sermon(by: sermons[indexPath.row].preacher, from: sermons[indexPath.row].text, on: sermons[indexPath.row].title, onThe: sermons[indexPath.row].date, withImage: sermons[indexPath.row].imageName, withSumamry: sermons[indexPath.row].synopsis)
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "PlayerTransitionIdentifier", sender: self)
    }
    
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlayerTransitionIdentifier" {
            let playerTransitionVC = segue.destination as! PlayerTransitionViewController
            playerTransitionVC.sermonUpdate = sermonUpdate
        }
        else if segue.identifier == "SermonBySeriesIdentifier"{
            let sermonBySeriesTransitionVC = segue.destination as! SermonBySeriesViewController
            sermonBySeriesTransitionVC.sermonUpdate = sermonUpdate
        }
    }
    
    @IBAction func pressSeries(_ sender: Any) {
        performSegue(withIdentifier: "SermonBySeriesIdentifier", sender: self)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}

