//
//  AboutTableViewCell.swift
//  sgbc
//
//  Created by ADMIN on 13/07/2022.
//

import UIKit

class AboutTableViewCell: UITableViewCell {

    @IBOutlet weak var sectionTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(with info: [News], atIndex indexPath: IndexPath){
        sectionTextLabel.text = info[indexPath.row].newsContent
    }

  
    
}
