//
//  SearchTableViewCell.swift
//  sgbc
//
//  Created by ADMIN on 18/07/2022.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var sermonPodcastImageView: UIImageView!
    @IBOutlet weak var sermonPodcastTitle: UILabel!
    @IBOutlet weak var categoryTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        sermonPodcastImageView.layer.cornerRadius = 10
        
    }

    func configureCell(data searchData: [Sermon], index indexPath: IndexPath){
        sermonPodcastImageView.image = UIImage(named: searchData[indexPath.row].imageName)
        sermonPodcastTitle.text = searchData[indexPath.row].title
        categoryTitle.text = searchData[indexPath.row].date
    }
    
    // Create another configure cell function that works based on the category
    
    func configurecell(data searchData: [Any], index indexPath: IndexPath){
        
        if searchData[indexPath.row] is Sermon{
            let data = searchData[indexPath.row] as! Sermon
            sermonPodcastImageView.image = UIImage(named: data.imageName)
            sermonPodcastTitle.text = data.title
            categoryTitle.text = "Sermon"
        }
        else if searchData[indexPath.row] is Podcast{
            let data = searchData[indexPath.row] as! Podcast
            sermonPodcastImageView.image = UIImage(named: data.podcastImageName)
            sermonPodcastTitle.text = data.podcastTitle
            categoryTitle.text = "Podcast"
            
        }
    
}


}
