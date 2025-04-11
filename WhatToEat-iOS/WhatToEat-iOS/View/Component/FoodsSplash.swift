//
//  FoodsSplash.swift
//  WhatToEat-iOS
//
//  Created by 서준영 on 4/12/25.
//

import SwiftUI

struct FoodsSplashTop: View {
    var body: some View {
        HStack {
            Image("rice")
            Image("potato")
            Image("sushi")
            Image("spagetti")
            Image("chicken")
        }
    }
}

struct FoodSplashBottom: View {
    var body: some View {
        HStack {
            Image("burger")
            Image("sushi")
            Image("beer")
            Image("spainach")
            Image("riceBall")
        }
    }
}

#Preview {
    Group {
        FoodsSplashTop()
        FoodSplashBottom()
    }
}
