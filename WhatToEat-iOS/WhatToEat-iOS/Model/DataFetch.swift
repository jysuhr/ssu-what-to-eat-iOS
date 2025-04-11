//
//  DataFetch.swift
//  WhatToEat-iOS
//
//  Created by 서준영 on 4/12/25.
//
//
//import SwiftUI
//import SwiftCSV
//import UniformTypeIdentifiers
//
//struct CSVReaderView: View {
//    @State private var restaurants: [Restaurant] = []
//
//    var body: some View {
//        VStack {
//            List(restaurants) { restaurant in
//                VStack(alignment: .leading) {
//                    Text(restaurant.name)
//                        .font(.headline)
//                    Text("위치: \(restaurant.location)")
//                        .font(.subheadline)
//                    Text("음식 분류: \(restaurant.category)")
//                        .font(.subheadline)
//                    if let delivery = restaurant.delivery {
//                        Text("포장/배달 전문: \(delivery)")
//                            .font(.subheadline)
//                    }
//                    if let url = restaurant.url {
//                        Text("URL: \(url)")
//                            .font(.subheadline)
//                            .foregroundColor(.blue)
//                    }
//                }
//            }
//            
//            Button("CSV 불러오기") {
//                loadCSV()
//            }
//            .padding()
//        }
//    }
//
//    func loadCSV() {
//        guard let fileURL = Bundle.main.url(forResource: "restaurants", withExtension: "csv") else {
//            print("CSV 파일을 찾을 수 없습니다.")
//            return
//        }
//
//        do {
//            let csv = try CSV<Named>(url: fileURL)
//            let rows = csv.rows  // 각 행을 딕셔너리로 가져옴
//
//            let mapped = rows.compactMap { row -> Restaurant? in
//                guard let name = row["음식점"],
//                      let location = row["위치(도로명)"],
//                      let category = row["음식분류"],
//                      let isBarString = row["술집"],
//                      let foodTypes = row["음식종류(사용 X)"],
//                      let url = row["URL"] else { return nil }
//
//                let isBar = isBarString == "1"  // 술집 여부 처리 (숫자 값이므로 "1"이면 술집으로 간주)
//                return Restaurant(
//                    name: name,
//                    location: location,
//                    category: category,
//                    isBar: isBar,
//                    foodTypes: foodTypes,
//                    delivery: row["포장/배달전문"],  // 포장/배달전문 값
//                    hasSoup: row["국물유무"],  // 국물유무 값
//                    url: url
//                )
//            }
//
//            self.restaurants = mapped  // 결과 할당
//        } catch {
//            print("CSV 파싱 실패: \(error)")
//        }
//    }
//}
