//
//  ChannelScrollView.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/30/25.
//

import SwiftUI

struct ChannelScrollView: View {
    
    let channels = ["channel1", "channel2", "channel3", "channel4"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 7) {
                ForEach(channels, id: \.self) { channel in
                    Image(channel)
                        .resizable()
                        .frame(width: 90, height: 45)
                }
            }
        }
        .padding(.leading, 15)
    }
}

#Preview {
    ChannelScrollView()
}
