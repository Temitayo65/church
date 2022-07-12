//
//  Sermon.swift
//  sgbc
//
//  Created by ADMIN on 11/07/2022.
//

import Foundation
import UIKit


struct Sermon{
    var title : String
    var text : String
    var preacher : String
    var date: String
    var imageName: String
    var synopsis: String
    
    init(by preacher: String, from text: String, on title: String, onThe date: String, withImage imageName: String, withSumamry synopsis: String){
        self.preacher = preacher
        self.text = text
        self.title = title
        self.date = date
        self.imageName = imageName
        self.synopsis = synopsis
    }
    
    init(){
        self.preacher = ""
        self.text = ""
        self.title = ""
        self.date = ""
        self.imageName = ""
        self.synopsis = ""
        
    }
    
}
