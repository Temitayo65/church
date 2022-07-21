//
//  HomeTableViewCell.swift
//  sgbc
//
//  Created by ADMIN on 12/07/2022.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func configureCell(with category: [String], atIndex indexPath: IndexPath){
        categoryLabel.text = category[indexPath.row]
        categoryLabel.textAlignment = .center
        categoryImageView.image = UIImage(named: "ministries")
    }

    
    
    
}
