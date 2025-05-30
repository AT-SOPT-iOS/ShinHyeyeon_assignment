//
//  SampleView.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/30/25.
//

import SwiftUI

struct SampleView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(edges: .all)
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    SampleView()
}
