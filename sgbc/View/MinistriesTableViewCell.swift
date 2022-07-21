//
//  MinistriesTableViewCell.swift
//  sgbc
//
//  Created by ADMIN on 13/07/2022.
//

import UIKit

class MinistriesTableViewCell: UITableViewCell {

    @IBOutlet weak var ministriesImageView: UIImageView!
    @IBOutlet weak var minstriesLabel: UILabel!
    let ministries = HomeData().getMinistriesCategories()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ministriesImageView.layer.cornerRadius = 5
    }

    func configureCell(with ministry: [Ministry], atIndex indexPath: IndexPath){
        ministriesImageView.image = UIImage(named: ministry[indexPath.row].imageName)
        minstriesLabel.text = ministry[indexPath.row].ministryName
    }
    
    
}
