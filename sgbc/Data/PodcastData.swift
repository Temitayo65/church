//
//  PodcastData.swift
//  sgbc
//
//  Created by ADMIN on 14/07/2022.
//

import Foundation

struct PodcastData{
    
    private let podcastCategories: [PodcastCategories] = [
        PodcastCategories(podcastCategoryName: "Podcasts", podcastCategoryImageName: "m"),
        PodcastCategories(podcastCategoryName: "Devotionals", podcastCategoryImageName: "m"),
        PodcastCategories(podcastCategoryName: "Q&A", podcastCategoryImageName: "m")
    ]
    
    private let podcasts: [Podcast] = [
    Podcast(podcastTitle: "Husband love your wives", podcastDate: "10th July, 2022", podcastImageName: "i", episode: "Episode 1"),
    Podcast(podcastTitle: "Husband love your wives", podcastDate: "12th July, 2022", podcastImageName: "i", episode: "Episode 2"),
    Podcast(podcastTitle: "Husband love your wives", podcastDate: "14th July, 2022", podcastImageName: "i", episode: "Episode 3"),
    Podcast(podcastTitle: "Husband love your wives", podcastDate: "15th July, 2022", podcastImageName: "i", episode: "Episode 4"),
    Podcast(podcastTitle: "Wives Submit to your husband", podcastDate: "10th July, 2022", podcastImageName: "i", episode: "Episode 1"),
    Podcast(podcastTitle: "Wives Submit to your husband", podcastDate: "13th July, 2022", podcastImageName: "i", episode: "Episode 2"),
    
    ]
    private let devotionals: [Devotional] = [
        Devotional(devotionalName: "Think on These Things", devotionalDate: "20th August 2020", devotionalImageName: "m"),
        Devotional(devotionalName: "Think on These Things", devotionalDate: "20th August 2020", devotionalImageName: "n"),
        Devotional(devotionalName: "Think on These Things", devotionalDate: "20th August 2020", devotionalImageName: "m"),
        Devotional(devotionalName: "Think on These Things", devotionalDate: "20th August 2020", devotionalImageName: "n"),
        Devotional(devotionalName: "Think on These Things", devotionalDate: "20th August 2020", devotionalImageName: "m"),
        Devotional(devotionalName: "Think on These Things", devotionalDate: "20th August 2020", devotionalImageName: "n"),
        Devotional(devotionalName: "Think on These Things", devotionalDate: "20th August 2020", devotionalImageName: "m"),
        Devotional(devotionalName: "Think on These Things", devotionalDate: "20th August 2020", devotionalImageName: "n"),
        
    
    ]
    
    private let q_and_a: [QA] = [
        QA(q_a_title: "What is regeneration?", q_a_date: "12th Jume, 2022", q_a_imageName: "c"),
        QA(q_a_title: "What does the bible say about Relocating?", q_a_date: "12th Jume, 2022", q_a_imageName: "e"),
        QA(q_a_title: "Why was hell made?", q_a_date: "12th Jume, 2022", q_a_imageName: "a"),
        QA(q_a_title: "What is Christian Liberty?", q_a_date: "12th Jume, 2022", q_a_imageName: "m"),
    ]
    
    func getPodcasts()->[Podcast]{
        return podcasts
    }
    
    func getDevotionals()->[Devotional]{
        return devotionals
    }
    
    func getQA()->[QA]{
        return q_and_a
    }
    
    func getPodcastCategories()->[PodcastCategories]{
        return podcastCategories
    }
}

struct PodcastCategories{
    var podcastCategoryName: String
    var podcastCategoryImageName: String
}
