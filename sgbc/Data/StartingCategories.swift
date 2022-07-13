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
    private let news : [News] = [
    
    ]
    
    
    func getHomeCategories()->[String]{
        return homeCategories
    }
    
    func getMeidaCategories()->[String]{
        return mediaCategories
    }
    
    func getNews()->[News]{
        return news 
    }
    
    
    
    
}
