//
//  ChannelContent.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/9/25.
//

import UIKit

struct ChannelContent {
    let logoImage: UIImage
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
