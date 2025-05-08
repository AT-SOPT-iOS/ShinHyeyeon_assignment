//
//  MasterpieceContent.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/9/25.
//

import UIKit

struct MasterpieceContent {
    let posterImage: UIImage
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
