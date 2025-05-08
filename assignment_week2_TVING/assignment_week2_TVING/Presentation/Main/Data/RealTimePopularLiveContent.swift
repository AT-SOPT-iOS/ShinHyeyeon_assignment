//
//  RealTimePopularLiveContent.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/9/25.
//

import UIKit

struct RealTimePopularLiveContent {
    let posterImage: UIImage
    let rank: Int
    let title: String
    let episode: String
    let ratings: String
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
