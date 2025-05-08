//
//  BaseballContent.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/9/25.
//

import UIKit

struct BaseballContent {
    let logoImage: UIImage
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
