//
//  LiveScrollView.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/30/25.
//

import SwiftUI

struct LiveScrollView: View {
    
    let programs = ["program1", "program2", "program3", "program4"]
    
    let programDetails: [String: (title: String, episode: String, rating: String)] = [
        "program1": ("별들에게 물어봐", "14화", "24.1%"),
        "program2": ("환승연애3", "이춘섭리포트 34화", "27.2%"),
        "program3": ("검은 태양", "8화", "16.4%"),
        "program4": ("환혼: 빛과 그림자", "20화", "15.2%")
    ]
    
    var body: some View {
        VStack(spacing: 9) {
            HStack(spacing: 0) {
                Text("실시간 인기 LIVE")
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
                LazyHStack(spacing: 7) {
                    ForEach (Array(programs.enumerated()), id: \.element) { index, program in
                        VStack(alignment: .leading) {
                            Image("\(program)")
                                .resizable()
                                .frame(width: 160, height: 80)
                                .cornerRadius(3)
                            
                            HStack(alignment: .top) {
                                Text("\(index + 1)")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 19, weight: .bold))
                                    .rotationEffect(.degrees(10))
                                VStack(alignment: .leading, spacing: 2)  {
                                    if let detail = programDetails[program] {
                                        Text(detail.title)
                                            .foregroundStyle(.white)
                                            .font(.system(size: 10, weight: .medium))
                                        Text(detail.episode)
                                            .foregroundStyle(.gray)
                                            .font(.system(size: 10, weight: .regular))
                                        Text(detail.rating)
                                            .foregroundStyle(.gray)
                                            .font(.system(size: 10, weight: .regular))
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .padding(.leading, 12)
        }
        .background(Color.black)
    }
}

#Preview {
    LiveScrollView()
}
