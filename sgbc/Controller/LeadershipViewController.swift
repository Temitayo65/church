//
//  LeadershipViewController.swift
//  sgbc
//
//  Created by ADMIN on 13/07/2022.
//

import UIKit

class LeadershipViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
 

    @IBOutlet weak var leadershipCollectionView: UICollectionView!
    @IBOutlet weak var leadershipBackImage: UIImageView!
    
    let sermons = SermonData().getSermon()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leadershipCollectionView.delegate = self
        leadershipCollectionView.dataSource = self
        leadershipCollectionView.register(UINib(nibName: "LeadershipCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LeadershipCellIdentifier")
        leadershipBackImage.image = UIImage(named: "t")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // tabBarController?.tabBar.isHidden = true // may not be needed to be hidden /Users/admin/Downloads/SWIFT/CHURCH/sgbc/sgbc/Controller/LeadershipViewController.swift
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sermons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LeadershipCellIdentifier", for: indexPath) as? LeadershipCollectionViewCell{
            cell.configureCell(with: sermons, atIndex: indexPath)
            return cell
        }
        return UICollectionViewCell()
    }
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension LeadershipViewController: UICollectionViewDelegateFlowLayout{
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 300, height: 650)
        }
    
}
