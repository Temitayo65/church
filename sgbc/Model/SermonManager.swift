//
//  SermonManager.swift
//  sgbc
//
//  Created by ADMIN on 24/07/2022.
//

import Foundation


struct SermonManager{
    
    let baseURL = "https://still-savannah-43128.herokuapp.com/media/audios"
    var all_links: [Datas] = []
    
    func fetchSermons(sermonURL: String){
        let sermonURL = baseURL
        performRequest(urlString: sermonURL)
    }
    
    func performRequest(urlString: String ){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    print(error!)
                    return
                }
                if let safeData = data{
                    do{
                        let decoder = JSONDecoder()
                        let decodedData =  try decoder.decode(SermonsData.self, from: safeData)
                        var links: [Datas] = []
                        for item in decodedData.data{
                            links.append(item)
                        }
                    } catch {
                        print(error)
                    }
                }
            }
            task.resume()
            
        }
                
    }
    
    
}
