//
//  SermonManager.swift
//  sgbc
//
//  Created by ADMIN on 24/07/2022.
//

import Foundation
protocol SermonManagerDelegate{
    func didUpdateSermonData(sermonDatas: String)
}

struct SermonManager{
    let baseURL = "https://still-savannah-43128.herokuapp.com/media/audios"
    var delegate: SermonManagerDelegate?
   
    
    func fetchSermons(index: Int){
        performRequest(urlString: baseURL, index: index)
    }
    
    func performRequest(urlString: String , index: Int){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    print(error!)
                    return
                }
                if let safeData = data{
                    if let links = parseJSON(data: safeData, index: index){
                        self.delegate?.didUpdateSermonData(sermonDatas: links)
                    }
                }
            }
            task.resume()
        }
                
    }
    
    func parseJSON(data: Data, index: Int)-> String?{
        do{
            let decoder = JSONDecoder()
            let decodedData =  try decoder.decode(SermonsData.self, from: data)
            let link = decodedData.data[index].sermonAudio.audio_url
            print("Index:",index,"Link:", link )
            return link
            
        } catch {
            print(error)
            return nil
        }
        
    }
    
   
        
}
    

