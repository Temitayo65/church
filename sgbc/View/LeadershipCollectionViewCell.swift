//
//  LeadershipCollectionViewCell.swift
//  sgbc
//
//  Created by ADMIN on 13/07/2022.
//

import UIKit

class LeadershipCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var leadershipImageView: UIImageView!
    @IBOutlet weak var leaderNameLabel: UILabel!
    @IBOutlet weak var aboutLeaderLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        leadershipImageView.layer.cornerRadius = 5
        
    }

    func configureCell(with info: [Sermon], atIndex indexPath: IndexPath){
        leaderNameLabel.text = info[indexPath.row].preacher
        leadershipImageView.image = UIImage(named: info[indexPath.row].imageName)
        aboutLeaderLabel.text = info[indexPath.row].synopsis
        aboutLeaderLabel.textAlignment = .left
    }
    
}
