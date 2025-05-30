//
//  BaseballScrollView.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/30/25.
//

import SwiftUI

struct BaseballScrollView: View {
    
    let teams = ["team1", "team2", "team3", "team4", "team5", "team6"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 0) {
                ForEach(Array(teams.enumerated()), id: \.element) { index, team in
                    ZStack {
                        if index % 2 == 0 {
                            Color.white
                        }
                        
                        Image(team)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 50)
                    }
                    .frame(width: 80, height: 50)
                }
            }
        }
    }
}

#Preview {
    BaseballScrollView()
}
