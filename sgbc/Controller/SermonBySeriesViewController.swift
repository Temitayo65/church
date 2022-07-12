//
//  SermonBySeriesViewController.swift
//  sgbc
//
//  Created by ADMIN on 12/07/2022.
//

import UIKit

class SermonBySeriesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    let sermons = SermonData().getSermon()
    var sermonUpdate = Sermon()
    let itemsPerRow: CGFloat = 3
    let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)

    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBOutlet weak var SermonBySeriesCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        SermonBySeriesCollectionView.delegate = self
        SermonBySeriesCollectionView.dataSource = self
        SermonBySeriesCollectionView.register(UINib(nibName: "SermonBySeriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SeriesCollectionViewCell")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sermons.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = SermonBySeriesCollectionView.dequeueReusableCell(withReuseIdentifier: "SeriesCollectionViewCell", for: indexPath) as? SermonBySeriesCollectionViewCell{
            cell.configureCell(with: sermons, atIndex: indexPath)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    
}


extension SermonBySeriesViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 0.0
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0.0
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            return CGSize(width: 180, height: 200)
        }
    
}

