//
//  MediaTableViewCell.swift
//  sgbc
//
//  Created by ADMIN on 13/07/2022.
//

import UIKit

class MediaTableViewCell: UITableViewCell {

    let category = HomeData().getMediaCategories()
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    
    func configureCell(with category: [String], atIndex indexPath: IndexPath){
        categoryLabel.text = category[indexPath.row]
        categoryLabel.textAlignment = .center
        categoryImageView.image = UIImage(named: "ministries")
        
    }
}
