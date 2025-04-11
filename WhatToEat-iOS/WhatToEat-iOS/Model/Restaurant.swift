//
//  Restaurant.swift
//  WhatToEat-iOS
//
//  Created by 서준영 on 4/12/25.
//

import Foundation

struct Restaurant: Identifiable {
    let name: String
    let location: String
    let category: String
    let url: String
    let isBar: Bool = false
    let foodTypes: String
    let delivery: Bool = false
    let hasSoup: Bool = false
    var id = UUID()
    
    init(raw: [String]) {
        name = raw[0]
        location = raw[1]
        category = raw[2]
        foodTypes = raw[4]
        url = raw[7]/*.isEmpty ? "" : raw[7]*/
    }
}

func loadCSV(from csvName: String) -> [Restaurant] {
    var csvToStruct = [Restaurant]()
    
    guard let filePath = Bundle.main.path(forResource: csvName, ofType: "csv") else {
        return []
    }
    
    var data = ""
    do {
        data = try String(contentsOfFile: filePath)
    } catch {
        print(error)
        return []
    }
    
    var rows = data.components(separatedBy: "\n")
    
    let columnCount = rows.first?.components(separatedBy: ",").count
    rows.removeFirst()
    
    for row in rows {
        let csvColumns = row.components(separatedBy: ",")
        if csvColumns.count == columnCount {
            let restaurantStruct = Restaurant(raw: csvColumns)
            csvToStruct.append(restaurantStruct)
        }
    }
    return csvToStruct
}
