//
//  DailyBoxOfficeResponseBody.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/13/25.
//

import Foundation

struct DailyBoxOfficeResponseBody: Codable {
    let boxOfficeResult: BoxOfficeResult
}

struct BoxOfficeResult: Codable {
    let boxofficeType: String
    let showRange: String
    let dailyBoxOfficeList: [DailyBoxOffice]
}

struct DailyBoxOffice: Codable {
    let rank: String
    let movieNm: String
    let openDt: String
    let audiCnt: String
    let audiAcc: String
    let salesAmt: String
}
