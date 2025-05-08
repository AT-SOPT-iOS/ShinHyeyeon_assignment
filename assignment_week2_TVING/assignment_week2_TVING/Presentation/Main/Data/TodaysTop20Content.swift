//
//  TodaysTop20Content.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/9/25.
//

import UIKit

struct TodaysTop20Content {
    let rank: Int
    let poster: UIImage
}

extension TodaysTop20Content {
    static func dummy() -> [TodaysTop20Content] {
        return [
            TodaysTop20Content(rank: 1, poster: .movie1),
            TodaysTop20Content(rank: 2, poster: .movie2),
            TodaysTop20Content(rank: 3, poster: .movie3)
        ]
    }
}
