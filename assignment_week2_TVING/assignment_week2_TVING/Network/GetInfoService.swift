//
//  GetInfoService.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/13/25.
//

import Foundation

class GetInfoService {
    
    static let shared = GetInfoService()
    private init() {}
    
    private let apiKey = Bundle.main.infoDictionary?["API_KEY"] as! String
    
    func makeRequest(targetDate: String) -> URLRequest? {
           var urlString = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"
           urlString += "?key=\(apiKey)&targetDt=\(targetDate)"

           guard let url = URL(string: urlString) else { return nil }

           var request = URLRequest(url: url)
           request.httpMethod = "GET"
           return request
       }
    
    func fetchDailyBoxOfficeList(targetDate: String) async throws -> [DailyBoxOffice] {
        guard let request = makeRequest(targetDate: targetDate) else {
            throw NetworkError.requestEncodingError
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.responseError
        }
        
        do {
            let decoded = try JSONDecoder().decode(DailyBoxOfficeResponseBody.self, from: data)
            return decoded.boxOfficeResult.dailyBoxOfficeList
        } catch {
            print("디코딩 실패: \(error)")
            throw NetworkError.responseDecodingError
        }
    }
}
