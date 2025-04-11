//
//  ContentView.swift
//  WhatToEat-iOS
//
//  Created by 서준영 on 4/11/25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var isLaunch: Bool = true
    
    var body: some View {
        if isLaunch {
            SplashView()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        withAnimation(.linear) {
                            self.isLaunch = false
                        }
                    }
                }
        } else {
            NavigationView {
                ZStack {
                    Color(hex: "#F2F4F7")
                        .ignoresSafeArea()
                    
                    NavigationLink(destination: FilterView()) {
                        ZStack {
                            SplashView()
                            VStack {
                                Spacer()
                                
                                HStack {
                                    Text("시작하기")
                                }
                                .frame(width: 361, height: 56)
                                .foregroundStyle(.white)
                                .background(Color(hex: "#4288EB"))
                                .cornerRadius(12)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
