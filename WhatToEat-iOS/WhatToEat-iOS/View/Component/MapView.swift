//
//  MapView.swift
//  WhatToEat-iOS
//
//  Created by 서준영 on 4/12/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    private let locationManager = CLLocationManager()
    @State private var route: MKRoute?
    @State private var name = ""
    @State private var time = 0.0
    @State private var distance = 0.0
    @State private var navigation: [String] = []
    
    private let start = CLLocationCoordinate2D(latitude: 37.4945, longitude: 126.9596) // 숭실대 정보과학관
    let end: CLLocationCoordinate2D
    let restaurantName: String
    
    var body: some View {
        Map {
            UserAnnotation()
            
            Marker("현재 위치", coordinate: start)
            Marker(restaurantName, coordinate: end)
            
            if let route {
                MapPolyline(route)
                    .stroke(Color.cyan, style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
            }
        }
        .mapControls {
            MapUserLocationButton()
            MapCompass()
        }
        .onAppear {
            locationManager.requestWhenInUseAuthorization()
            withAnimation {
                getRoute()
            }
        }
    }
    
    private func getRoute() {
        route = nil
        if !navigation.isEmpty {
            navigation = []
        }
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: start))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: end))
        request.transportType = .walking
        
        Task {
            let directions = MKDirections(request: request)
            let response = try? await directions.calculate()
            
            if let result = response?.routes.first {
                DispatchQueue.main.async {
                    self.route = result
                    self.name = result.name
                    self.time = result.expectedTravelTime
                    self.distance = result.distance
                }
            }
        }
    }
}

#Preview {
    MapView(end: CLLocationCoordinate2D(latitude: 37.4951134, longitude: 126.956902), restaurantName: "맥도날드") // 맥도날드
}
