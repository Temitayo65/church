//
//  NewsDetailsTableViewCell.swift
//  sgbc
//
//  Created by ADMIN on 14/07/2022.
//

import UIKit

class NewsDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsDetailsImageView: UIImageView!
    @IBOutlet weak var newsDetailsFirstContent: UILabel!
    @IBOutlet weak var newsDetailsSecondContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func configureCell(with info: News){
        newsDetailsImageView.image = UIImage(named: info.imageName)
        let details = info.newsContent
        let index = details.firstIndex(of: ".")!
        let first_part = String(details[...index])
        let last_part = String(details.suffix(details.count - first_part.count - 1))
        newsDetailsFirstContent.text = first_part
        newsDetailsSecondContent.text = last_part
        newsDetailsImageView.layer.cornerRadius = 10
        
    }

 
}
