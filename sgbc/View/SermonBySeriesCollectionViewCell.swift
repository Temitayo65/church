//
//  SermonBySeriesCollectionViewCell.swift
//  sgbc
//
//  Created by ADMIN on 12/07/2022.
//

import UIKit

class SermonBySeriesCollectionViewCell: UICollectionViewCell {

        @IBOutlet weak var preacherImage: UIImageView!
        @IBOutlet weak var preacherName: UILabel!
        override func awakeFromNib() {
            super.awakeFromNib()
            preacherImage.clipsToBounds = true
            contentView.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
           
        }


        func configureCell(with sermon: [Sermon], atIndex indexPath: IndexPath){
            self.preacherImage.image = UIImage(named: sermon[indexPath.row].imageName)
            self.preacherName.text = sermon[indexPath.row].preacher
            self.preacherName.textColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
            self.preacherImage.layer.cornerRadius = 5
        }
  
}
