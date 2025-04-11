//
//  FilterView.swift
//  WhatToEat-iOS
//
//  Created by 서준영 on 4/12/25.
//

import SwiftUI

// MARK: - 카테고리 모델
struct Category {
    let name: String
    let iconName: String
}

struct FilterView: View {
    let categories: [Category] = [
        .init(name: "한식", iconName: "rice"),
        .init(name: "일식", iconName: "sushi"),
        .init(name: "양식", iconName: "spagetti"),
        .init(name: "중식", iconName: "spagetti"),
        .init(name: "치킨", iconName: "chicken"),
        .init(name: "패스트푸드", iconName: "burger"),
        .init(name: "아시안", iconName: "riceBall"),
        .init(name: "분식", iconName: "potato"),
        .init(name: "술집", iconName: "beer"),
        .init(name: "샐러드", iconName: "spainach")
    ]

    @State private var selectedCategories: Set<String> = []

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("먹고 싶지 않은 음식이 있으신가요?")
                        .font(.system(size: 20, weight: .bold))
                        .padding(.top, 16)
                        .padding(.leading, 20)
                        .padding(.bottom, 4)
                    Spacer()
                }
                HStack {
                    Text("아래에서 먹고 싶지 않은 음식을 선택해주세요!")
                        .padding(.leading, 20)
                    Spacer()
                }
                
                Spacer()
                
                LazyVStack(spacing: 16) {
                    ForEach(0..<categories.count / 2, id: \.self) { row in
                        HStack(spacing: 16) {
                            let left = categories[row * 2]
                            let right = categories[row * 2 + 1]
                            
                            FilterCategoryButton(
                                category: left,
                                isSelected: selectedCategories.contains(left.name)
                            ) {
                                toggleSelection(for: left.name)
                            }
                            
                            FilterCategoryButton(
                                category: right,
                                isSelected: selectedCategories.contains(right.name)
                            ) {
                                toggleSelection(for: right.name)
                            }
                        }
                    }
                }
                .padding()
                
                Spacer()
                
                NavigationLink(destination: RandomView(excludedCategories: selectedCategories)) {
                    HStack {
                        Text("추천 받기")
                    }
                    .frame(width: 361, height: 46)
                    .padding(10)
                    .foregroundStyle(.white)
                    .background(Color(hex: "#4288EB"))
                    .cornerRadius(12)
                }
                .padding()
            }
            
        }
        .navigationBarHidden(true)
    }

    private func toggleSelection(for category: String) {
        if selectedCategories.contains(category) {
            selectedCategories.remove(category)
        } else {
            selectedCategories.insert(category)
        }
    }
}

// MARK: - 필터 버튼
struct FilterCategoryButton: View {
    let category: Category
    let isSelected: Bool
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack {
                Image(category.iconName)
                    .resizable()
                    .frame(width: 24, height: 24)
                Text(category.name)
            }
        }
        .buttonStyle(FilterButtonStyle(isSelected: isSelected))
    }
}

// MARK: - 버튼 스타일
struct FilterButtonStyle: ButtonStyle {
    let isSelected: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .frame(width: 140, height: 20)
            .padding()
            .foregroundColor(isSelected ? Color.white : Color(hex: "#1D263366").opacity(0.4))
            .background(isSelected ? Color.blue : Color(hex: "#929AD").opacity(0.08))
            .cornerRadius(8)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

// MARK: - 미리보기
#Preview {
    NavigationStack {
        FilterView()
    }
}
