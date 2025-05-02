//
//  TodayTopModel.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/2/25.
//

import UIKit

struct TodayTopModel {
    let num: String
    let poster: UIImage
}

extension TodayTopModel  {
    static func dummy() -> [TodayTopModel] {
        return [
            TodayTopModel(num: "1", poster: .movie1),
            TodayTopModel(num: "2", poster: .movie2),
            TodayTopModel(num: "3", poster: .movie3)
        ]
    }
}
