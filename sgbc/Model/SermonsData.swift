//
//  SermonsData.swift
//  sgbc
//
//  Created by ADMIN on 24/07/2022.
//

import Foundation

struct SermonsData: Codable{
    
    let status: String
    let message: String
    let data: [Datas]
}

struct Datas: Codable{
    
    let title: String
    let sermonAudio: SermonAudio
}

struct SermonAudio: Codable{
    let audio_url: String 
}
