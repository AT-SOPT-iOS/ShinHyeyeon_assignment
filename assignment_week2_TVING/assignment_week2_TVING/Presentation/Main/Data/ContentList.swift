//
//  ContentList.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/3/25.
//

import UIKit

// 1
struct TodaysTop20Content {
    let rank: Int
    let poster: UIImage
}

// 2
struct RealTimePopularLiveContent {
    let posterImage: UIImage
    let rank: Int
    let title: String
    let episode: String
    let ratings: String
}

// 3
struct RealTimePopularMovieContent {
    let posterImage: UIImage
}

// 4
struct BaseballContent {
    let logoImage: UIImage
}

// 5
struct ChannelContent {
    let logoImage: UIImage
}

// 6
struct MasterpieceContent {
    let posterImage: UIImage
}

extension TodaysTop20Content  {
    static func dummy() -> [TodaysTop20Content] {
        return [
            TodaysTop20Content(rank: 1, poster: .movie1),
            TodaysTop20Content(rank: 2, poster: .movie2),
            TodaysTop20Content(rank: 3, poster: .movie3)
        ]
    }
}

extension RealTimePopularLiveContent  {
    static func dummy() -> [RealTimePopularLiveContent] {
        return [
            .init(posterImage: .program1, rank: 1, title: "별들에게 물어봐", episode: "20화", ratings: "27.2%"),
            .init(posterImage: .program2, rank: 2, title: "선재업고 튀어", episode: "1부 2회", ratings: "24.1%"),
            .init(posterImage: .program3, rank: 3, title: "환승연애3", episode: "3화", ratings: "33.3%"),
            .init(posterImage: .program4, rank: 4, title: "뿅뿅지구오락실", episode: "1화", ratings: "19.8%")
        ]
    }
}

extension RealTimePopularMovieContent {
    static func dummy() -> [RealTimePopularMovieContent] {
        return [
            .init(posterImage: .movie1),
            .init(posterImage: .movie2),
            .init(posterImage: .movie3),
            .init(posterImage: .movie4)
        ]
    }
}

extension BaseballContent {
    static func dummy() -> [BaseballContent] {
        return [
            .init(logoImage: .team1),
            .init(logoImage: .team2),
            .init(logoImage: .team3),
            .init(logoImage: .team4),
            .init(logoImage: .team5),
            .init(logoImage: .team6)
            
        ]
    }
}

extension ChannelContent {
    static func dummy() -> [ChannelContent] {
        return [
            .init(logoImage: .channel1),
            .init(logoImage: .channel2),
            .init(logoImage: .channel3),
            .init(logoImage: .channel4),
            .init(logoImage: .channel1),
            .init(logoImage: .channel2)
        ]
    }
}

extension MasterpieceContent {
    static func dummy() -> [MasterpieceContent] {
        return [
            .init(posterImage: .program1),
            .init(posterImage: .program2),
            .init(posterImage: .program3),
            .init(posterImage: .program4)
        ]
    }
}
