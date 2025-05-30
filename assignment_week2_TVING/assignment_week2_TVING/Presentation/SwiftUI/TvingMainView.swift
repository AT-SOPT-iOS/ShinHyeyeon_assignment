//
//  TvingMainView.swift
//  assignment_week2_TVING
//
//  Created by 신혜연 on 5/30/25.
//

import SwiftUI

struct TvingMainView: View {
    
    @State private var selectedTab: String = "홈"
    
    let tabs = ["홈", "드라마", "예능", "영화", "스포츠", "뉴스"]
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Image("tving_title")
                    .resizable()
                    .frame(width: 191, height: 78)
                
                Spacer()
                
                Image("search")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.trailing, 10)
                
                Image("logo")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.trailing, 11)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 28) {
                    ForEach(tabs, id: \.self) { tab in
                        Button(action: {
                            selectedTab = tab
                            print("selectedTab:", selectedTab)
                        }) {
                            VStack(spacing: 7) {
                                Text(tab)
                                    .foregroundColor(selectedTab == tab ? .white : .gray)
                                    .bold()
                                Rectangle()
                                    .frame(width: 15, height: 3)
                                    .foregroundColor(selectedTab == tab ? .white : .clear)
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 16)
            
            Spacer()
            
            ScrollView(showsIndicators: false) {
                if selectedTab == "홈" {
                    VStack(spacing: 0) {
                        Image("main_poster")
                            .resizable()
                            .frame(height: 400)
                        
                        PosterScrollView()
                            .padding(.top, 9)
                        
                        LiveScrollView()
                            .padding(.top, 18)
                        
                        MovieScrollView()
                            .padding(.top, 18)
                        
                        BaseballScrollView()
                            .padding(.top, 28)
                        
                        ChannelScrollView()
                            .padding(.top, 28)
                        
                        Top5ScrollView()
                            .padding(.top, 25)
                        
                        HStack(spacing: 0) {
                            Text("공지")
                                .foregroundColor(.gray)
                                .font(.system(size: 11, weight: .medium))
                                .padding(.leading, 17)
                            
                            Text("티빙 계정 공유 정책 추가 안내")
                                .foregroundColor(.white)
                                .font(.system(size: 11, weight: .medium))
                                .padding(.leading, 8)
                            
                            Spacer()
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.white)
                                    .frame(width: 18, height: 18)
                            }
                            .padding(.trailing, 16)
                        }
                        .frame(width: 347, height: 50)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.gray.opacity(0.2))
                        )
                        .padding(.horizontal, 14)
                        .padding(.top, 23)
                        
                        HStack {
                            Text("고객문의 • 이용약관 •\n사업자정보 • 인재채용")
                                .foregroundColor(.gray)
                                .font(.system(size: 11, weight: .medium))
                                .padding(.top, 13)
                                .padding(.leading, 20)
                            
                            Spacer()
                        }
                    }
                    .frame(maxWidth: .infinity)
                } else {
                    SampleView()
                }
            }
        }
        .background(Color.black)
    }
}


//#Preview {
//    TvingMainView()
//}
