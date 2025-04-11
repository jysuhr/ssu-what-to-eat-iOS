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
            MapView(end: CLLocationCoordinate2D(latitude: 37.4979861, longitude: 126.9523913), restaurantName: "움프 Oomph") // 움프
        }
    }
}

#Preview {
    FindRouteView()
}
