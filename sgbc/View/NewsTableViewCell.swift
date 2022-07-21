//
//  NewsTableViewCell.swift
//  sgbc
//
//  Created by ADMIN on 13/07/2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsContent: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configureCell(with info: [News], atIndex indexPath: IndexPath){
        newsImageView.image = UIImage(named: "d")
        newsTitleLabel.text = info[indexPath.row].topic
        newsContent.text = info[indexPath.row].newsContent
        dateLabel.text = info[indexPath.row].date
        newsContent.textAlignment = .left
        dateLabel.textAlignment = .left
        newsImageView.layer.cornerRadius = 10
    }
    
    
}
