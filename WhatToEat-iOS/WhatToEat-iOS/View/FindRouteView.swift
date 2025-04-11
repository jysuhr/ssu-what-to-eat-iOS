//
//  FindRouteView.swift
//  WhatToEat-iOS
//
//  Created by 서준영 on 4/12/25.
//

import SwiftUI
import MapKit

struct FindRouteView: View {
    var body: some View {
        VStack {
            MapView(end: CLLocationCoordinate2D(latitude: 37.4951134, longitude: 126.956902), restaurantName: "맥도날드") // 맥도날드
//                .frame(height: 400)
        }
    }
}

#Preview {
    FindRouteView()
}
