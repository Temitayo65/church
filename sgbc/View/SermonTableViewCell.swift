//
//  SermonTableViewCell.swift
//  sgbc
//
//  Created by ADMIN on 11/07/2022.
//

import UIKit

class SermonTableViewCell: UITableViewCell {

    @IBOutlet weak var sermonImageView: UIImageView!
    @IBOutlet weak var sermonTitleLabel: UILabel!
    @IBOutlet weak var sermonTextLabel: UILabel!
    @IBOutlet weak var preacherLabel: UILabel!
    @IBOutlet weak var sermonDateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        sermonImageView.layer.cornerRadius = 10
        sermonImageView.layer.masksToBounds = true
        sermonImageView.clipsToBounds = true
        contentView.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        contentView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(with sermon: [Sermon], atIndex indexPath: IndexPath){
        self.sermonImageView.image = UIImage(named: sermon[indexPath.row].imageName)
        self.sermonTitleLabel.text = sermon[indexPath.row].title
        self.sermonTextLabel.text = sermon[indexPath.row].text
        self.sermonTitleLabel.textColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        self.sermonDateLabel.text = sermon[indexPath.row].date
        self.sermonDateLabel.textColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        self.preacherLabel.text = sermon[indexPath.row].preacher
        self.preacherLabel.textColor = UIColor(red: 0.24, green: 0.40, blue: 0.78, alpha: 1.0)
    }
    
}
