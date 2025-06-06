//
//  MovieScrollView.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/30/25.
//

import SwiftUI

struct MovieScrollView: View {
    
    let posters = ["movie1", "movie2", "movie3", "movie4"]
    
    var body: some View {
        VStack(spacing: 13) {
            HStack(spacing: 0) {
                Text("실시간 인기 영화")
                    .foregroundStyle(.white)
                    .font(.system(size: 15))
                    .bold()
                    .padding(.leading, 13)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("더보기")
                        .foregroundStyle(.gray)
                        .font(.system(size: 12))
                        .padding(.trailing, 10)
                }
                
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 8) {
                    ForEach(posters, id: \.self) { poster in
                        HStack(alignment: .bottom) {
                            Image(poster)
                                .resizable()
                                .frame(width: 98, height: 146)
                                .cornerRadius(3)
                        }
                    }
                }
                .padding(.leading, 15)
            }
        }
        .background(Color.black)
    }
}

#Preview {
    MovieScrollView()
}
