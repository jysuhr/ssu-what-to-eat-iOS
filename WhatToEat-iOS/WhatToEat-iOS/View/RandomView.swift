//import SwiftUI
//
//struct RandomView: View {
//    let excludedCategories: Set<String>
//    let restaurants = loadCSV(from: "restaurants")
//
//    @State private var randomRestaurant: Restaurant?
//    
//    let urlString: String
//    @State private var image: Image? = nil
//
//    var body: some View {
//        NavigationView {
//            ZStack {
//                Color(hex: "#F2F4F7")
//                    .ignoresSafeArea()
//                
//                VStack {
//                    Rectangle()
//                        .frame(width: 361, height: 608)
//                        .cornerRadius(16)
//                        .padding(.top, 10)
//                        .padding(.horizontal, 16)
//                        .foregroundColor(.white)
//                    Spacer()
//                }
//                
//                VStack {
//                    if let restaurant = randomRestaurant {
//                        VStack(spacing: 0) {
//                            HStack {
//                                Text(restaurant.name)
//                                    .font(.system(size: 20))
//                                    .bold()
//                                    .padding(.top, 10)
//                                    .padding(.leading, 32)
//                                
//                                Text(restaurant.category)
//                                    .font(.system(size: 16))
//                                    .foregroundStyle(.secondary)
//                                    .offset(x: 2, y: 8)
//                                Spacer()
//                            }
//                            
//                            HStack {
//                                Text(restaurant.foodTypes)
//                                    .foregroundStyle(.secondary)
//                                    .padding(.leading, 32)
//                                    .padding(.top, 10)
//                                Spacer()
//                            }
//                            
//                            
////                            Image("burger")
////                                .resizable()
////                                .frame(width: 329, height: 176)
////                                .padding(.top, 86)
//                            
////                            if let urlImg = URL(string: restaurant.url) {
////                                AsyncImage(url: urlImg) {image in
////                                    image.resizable()
////                                    image.padding(.top, 86)
////                                } placeholder: {
////                                    ProgressView()
////                                }
////                                .frame(width: 329, height: 176)
////                            }
//                            
//                            if let image = image {
//                                image
//                                    .resizable()
//                                    .frame(width: 329, height: 176)
//                                    .padding(.top, 86)
//                            } else {
//                                ProgressView()
//                                    .frame(width: 329, height: 176)
//                                    .padding(.top, 86)
//                                    .onAppear {
//                                        loadImage()
//                                    }
//                            }
//                            
//                            Text(restaurant.url)
//                            
//                            
//                            Image("foodEX")
//                                .resizable()
//                                .frame(width: 329, height: 176)
//                                .padding(.top, 16)
//                                .padding(.bottom, 28)
//                            
//                            NavigationLink(destination: FindRouteView()) {
//                                HStack {
//                                    Image(systemName: "sparkles")
//                                    Text("길안내")
//                                }
//                                .frame(width: 328, height: 46)
//                                .foregroundStyle(.white)
//                                .background(Color(hex: "#4288EB"))
//                                .cornerRadius(8)
//                            }
//                            
//                            Spacer()
//                        }
//                        
//                    } else {
//                        Text("조건에 맞는 식당이 없습니다.")
//                            .foregroundStyle(.gray)
//                    }
//                    HStack {
//                        NavigationLink(destination: FilterView()) {
//                            HStack {
//                                Text("음식 다시 분류")
//                            }
//                            .frame(width: 140, height: 26)
//                            .padding()
//                            .foregroundStyle(.black)
//                            .background(Color(hex: "#929DAD").opacity(0.08))
//                            .cornerRadius(12)
//                        }
//                        
//                        Button("다시 추천받기") {
//                            pickRandomRestaurant()
//                        }
//                        .frame(width: 140, height: 26)
//                        .padding()
//                        .background(.black)
//                        .foregroundStyle(.white)
//                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                    }
//                    
//                }
//                .padding()
//                .onAppear {
//                    pickRandomRestaurant()
//                }
//            }
//        }
////        .navigationTitle(Text("추천 받기"))
//        .navigationBarHidden(true)
//    }
//
//    func pickRandomRestaurant() {
//        let filtered = restaurants.filter { !excludedCategories.contains($0.category) }
//        randomRestaurant = filtered.randomElement()
//    }
//    
//    private func loadImage() {
//        guard let url = URL(string: urlString) else { return }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let data = data, let uiImage = UIImage(data: data) {
//                DispatchQueue.main.async {
//                    self.image = Image(uiImage: uiImage)
//                }
//            }
//        }.resume()
//    }
//}
//
//#Preview {
//    RandomView(excludedCategories: ["한식", "분식"], urlString: "https://search.pstatic.net/common/?src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyMzAzMDFfMjUg%2FMDAxNjc3Njc1NzA0MjE0.CGUZl8uLCBvK-wDBva3CM1zP0J6f5CJTN2ZuXT5kxz8g.VdTOvOX69yQuYJqSMl6D0u_8k-jCv7YONtPXgyInCJsg.JPEG%2F0F6D2D96-B911-4BDF-9DEB-9B1141038564.jpeg%3Ftype%3Dw1500_60_sharpen")
//}
//

import SwiftUI

struct RandomView: View {
    let excludedCategories: Set<String>
    let restaurants = loadCSV(from: "restaurants")

    @State private var randomRestaurant: Restaurant?
    @State private var image: Image? = nil

    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "#F2F4F7")
                    .ignoresSafeArea()
                
                VStack {
                    Rectangle()
                        .frame(width: 361, height: 608)
                        .cornerRadius(16)
                        .padding(.top, 10)
                        .padding(.horizontal, 16)
                        .foregroundColor(.white)
                    Spacer()
                }
                
                VStack {
                    if let restaurant = randomRestaurant {
                        VStack(spacing: 0) {
                            HStack {
                                Text(restaurant.name)
                                    .font(.system(size: 20))
                                    .bold()
                                    .padding(.top, 10)
                                    .padding(.leading, 32)
                                
                                Text(restaurant.category)
                                    .font(.system(size: 16))
                                    .foregroundStyle(.secondary)
                                    .offset(x: 2, y: 8)
                                Spacer()
                            }
                            
                            HStack {
                                Text(restaurant.foodTypes)
                                    .foregroundStyle(.secondary)
                                    .padding(.leading, 32)
                                    .padding(.top, 10)
                                Spacer()
                            }
                            
                            if let image = image {
                                image
                                    .resizable()
                                    .frame(width: 329, height: 176)
                                    .padding(.top, 86)
                            } else {
                                ProgressView()
                                    .frame(width: 329, height: 176)
                                    .padding(.top, 86)
                            }
                            
                            Text(restaurant.url)
                                .font(.footnote)
                                .foregroundStyle(.gray)
                                .padding(.top, 4)
                            
                            Image("foodEX")
                                .resizable()
                                .frame(width: 329, height: 176)
                                .padding(.top, 16)
                                .padding(.bottom, 28)
                            
                            NavigationLink(destination: FindRouteView()) {
                                HStack {
                                    Image(systemName: "sparkles")
                                    Text("길안내")
                                }
                                .frame(width: 328, height: 46)
                                .foregroundStyle(.white)
                                .background(Color(hex: "#4288EB"))
                                .cornerRadius(8)
                            }
                            
                            Spacer()
                        }
                    } else {
                        Text("조건에 맞는 식당이 없습니다.")
                            .foregroundStyle(.gray)
                    }
                    
                    HStack {
                        NavigationLink(destination: FilterView()) {
                            HStack {
                                Text("음식 다시 분류")
                            }
                            .frame(width: 140, height: 26)
                            .padding()
                            .foregroundStyle(.black)
                            .background(Color(hex: "#929DAD").opacity(0.08))
                            .cornerRadius(12)
                        }
                        
                        Button("다시 추천받기") {
                            pickRandomRestaurant()
                        }
                        .frame(width: 140, height: 26)
                        .padding()
                        .background(.black)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .padding()
                .onAppear {
                    pickRandomRestaurant()
                }
                .onChange(of: randomRestaurant) { newValue in
                    if let newRestaurant = newValue {
                        loadImage(from: newRestaurant.url)
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }

    func pickRandomRestaurant() {
        let filtered = restaurants.filter { !excludedCategories.contains($0.category) }
        randomRestaurant = filtered.randomElement()
    }

    private func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let uiImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = Image(uiImage: uiImage)
                }
            }
        }.resume()
    }
}
