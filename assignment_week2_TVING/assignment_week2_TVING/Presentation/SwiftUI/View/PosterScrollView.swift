//
//  PosterScrollView.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/30/25.
//

import SwiftUI

struct PosterScrollView: View {
    
    let posters = ["movie1", "movie2", "movie3"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 9) {
            Text("오늘의 티빙 TOP 20")
                .foregroundStyle(.white)
                .font(.system(size: 15))
                .bold()
                .padding(.leading, 12)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(Array(posters.enumerated()), id: \.element) { index, poster in
                        HStack(alignment: .bottom) {
                            Text("\(index + 1)")
                                .foregroundStyle(.white)
                                .font(.system(size: 50, weight: .bold))
                                .rotationEffect(.degrees(10))
                            
                            Image(poster)
                                .resizable()
                                .frame(width: 98, height: 146)
                                .cornerRadius(3)
                        }
                    }
                }
                .padding(.leading, 16)
            }
        }
        .background(Color.black)
    }
}

#Preview {
    PosterScrollView()
}
