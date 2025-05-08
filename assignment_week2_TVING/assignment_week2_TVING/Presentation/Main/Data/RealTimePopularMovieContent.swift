//
//  RealTimePopularMovieContent.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/9/25.
//

import UIKit

struct RealTimePopularMovieContent {
    let posterImage: UIImage
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
