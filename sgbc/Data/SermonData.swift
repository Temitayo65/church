//
//  SermonData.swift
//  sgbc
//
//  Created by ADMIN on 11/07/2022.
//

import Foundation
struct SermonData{
    
    private let sermons : [Sermon] = [
        Sermon(by: "Tony Okoroh", from: "John 8:34", on: "The Doctrine of God", onThe: "14th February, 2022", withImage: "photo", withSumamry: "As we draw closer to the end of our expository preaching on the book of 1John 4"),
        Sermon(by: "Tony Okoroh", from: "John 8:34", on: "The Doctrine of Man", onThe: "14th February, 2022", withImage: "b", withSumamry: "As we draw closer to the end of our expository preaching on the book of 1John 4"),
        Sermon(by: "Tony Okoroh", from: "John 8:34", on: "The Doctrine of Sin", onThe: "14th February, 2022", withImage: "c", withSumamry: "As we draw closer to the end of our expository preaching on the book of 1John 4"),
        Sermon(by: "Tony Okoroh", from: "John 8:34", on: "The Doctrine of Salvation", onThe: "14th February, 2022", withImage: "d", withSumamry: "As we draw closer to the end of our expository preaching on the book of 1John 4"),
        Sermon(by: "Tony Okoroh", from: "John 8:34", on: "The Doctrine of Trinity", onThe: "14th February, 2022", withImage: "e", withSumamry: "As we draw closer to the end of our expository preaching on the book of 1John 4"),
        Sermon(by: "Tony Okoroh", from: "John 8:34", on: "The Doctrine of Ascension", onThe: "14th February, 2022", withImage: "f", withSumamry: "As we draw closer to the end of our expository preaching on the book of 1John 4"),
        Sermon(by: "Tony Okoroh", from: "John 8:34", on: "The Doctrine of Humility", onThe: "14th February, 2022", withImage: "g", withSumamry: "As we draw closer to the end of our expository preaching on the book of 1John 4"),
        Sermon(by: "Tony Okoroh", from: "John 8:34", on: "The Doctrine of Solitariness", onThe: "14th February, 2022", withImage: "h", withSumamry: "As we draw closer to the end of our expository preaching on the book of 1John 4"),
        Sermon(by: "Tony Okoroh", from: "John 8:34", on: "The Doctrine of Eternity", onThe: "14th February, 2022", withImage: "i", withSumamry: "As we draw closer to the end of our expository preaching on the book of 1John 4"),
        Sermon(by: "Tony Okoroh", from: "John 8:34", on: "The Doctrine of Eschatology", onThe: "14th February, 2022", withImage: "j", withSumamry: "As we draw closer to the end of our expository preaching on the book of 1John 4"),
        Sermon(by: "Tony Okoroh", from: "John 8:34", on: "The Doctrine of Redemption", onThe: "14th February, 2022", withImage: "k", withSumamry: "As we draw closer to the end of our expository preaching on the book of 1John 4")
    ]
    
    
    func getSermon()-> [Sermon]{
        return sermons
    }
}
