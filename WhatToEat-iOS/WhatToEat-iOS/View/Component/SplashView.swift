//
//  SplashView.swift
//  WhatToEat-iOS
//
//  Created by 서준영 on 4/11/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color(hex: "#F2F4F7")
                .ignoresSafeArea(edges: .all)
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("뿌슝아,")
                            .font(.system(size: 20))
                            .fontWeight(.thin)
                            .foregroundStyle(Color(hex: "#1D2633"))
                        
                        Text("오늘 뭐 먹지?")
                            .foregroundStyle(Color(hex: "#4288EB"))
                            .font(.system(size: 48))
                            .fontWeight(.bold)
                            .lineSpacing(6)
                            .kerning(-0.48)
                            .alignmentGuide(.firstTextBaseline) { d in d[.firstTextBaseline] }
                        
                        Spacer()
                    }
                    .padding(20)
                    
                    Spacer()
                }
                
                Image("splashIcon")
                    .resizable()
                    .frame(width: 277, height: 256)
                    .padding(.vertical, 184)
            }
            
            VStack {
                FoodsSplashTop()
                    .padding(.top, 234)
                Spacer()
            }
            VStack {
                Spacer()
                FoodSplashBottom()
                    .padding(.bottom, 94)
            }
            
        }
    }
}

#Preview {
    SplashView()
}
