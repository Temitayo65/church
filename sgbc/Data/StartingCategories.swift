//
//  StartingCategories.swift
//  sgbc
//
//  Created by ADMIN on 12/07/2022.
//

import Foundation

struct HomeData{
    private let homeCategories : [String] = ["About SGBC", "SGBC'S Leadership", "Ministries", "Small Groups"]
    private let mediaCategories : [String] = ["Sermon", "Podcast", "Radio", "Blog"]
    private let ministriesCategories : [Ministry] = [
        Ministry(ministryName: "Blessed Children Ministry", imageName: "a"), Ministry(ministryName: "Blessed Youth Ministry", imageName: "b"), Ministry(ministryName: "Book Minsitry", imageName: "m"),Ministry(ministryName:  "University Bible Club", imageName: "e"),Ministry(ministryName: "Grace and Truth Theological Seminary", imageName: "f")
    ]
    
    
    func getHomeCategories()->[String]{
        return homeCategories
    }
    
    func getMediaCategories()->[String]{
        return mediaCategories
    }
    
    func getMinistriesCategories()->[Ministry]{
        return ministriesCategories
    }
    
}

struct Ministry{
    var ministryName: String
    var imageName: String
}
