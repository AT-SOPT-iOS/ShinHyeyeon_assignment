//
//  Top5ScrollView.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/30/25.
//

import SwiftUI

struct Top5ScrollView: View {
    
    let programs = ["program1", "program2", "program3", "program4"]
    
    var body: some View {
        VStack(spacing: 13) {
            HStack(spacing: 0) {
                Text("실시간 인기 LIVE")
                    .foregroundColor(.white)
                    .font(.system(size: 15, weight: .bold))

                Spacer()
            }
            .padding(.leading, 15)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 8) {
                    ForEach (programs, id: \.self) { program in
                        Image("\(program)")
                            .resizable()
                            .frame(width: 160, height: 90)
                            .cornerRadius(3)
                    }
                }
            }
            .padding(.leading, 16)
        }
    }
}

#Preview {
    Top5ScrollView()
}
