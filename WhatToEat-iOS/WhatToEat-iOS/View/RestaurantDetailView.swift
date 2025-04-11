//
//  RestaurantDetailView.swift
//  WhatToEat-iOS
//
//  Created by 서준영 on 4/12/25.
//

import SwiftUI
import MapKit

struct RestaurantDetailView: View {
    let name: String
    
    var body: some View {
        NavigationView {
            VStack {
                Text(name)
                    .font(.title)
                Spacer()
                NavigationLink(destination: FindRouteView()) {
                    HStack {
                        Image(systemName: "sparkles")
                        Text("길안내")
                    }
                    .frame(width: 200)
                    .padding(10)
                    .foregroundStyle(.white)
                    .background(.blue)
                    .cornerRadius(12)
                }
                NavigationLink(destination: FilterView()) {
                    HStack {
                        Image(systemName: "sparkles")
                        Text("필터뷰로")
                    }
                    .frame(width: 200)
                    .padding(10)
                    .foregroundStyle(.white)
                    .background(.blue)
                    .cornerRadius(12)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    RestaurantDetailView(name: "멘동")
}
