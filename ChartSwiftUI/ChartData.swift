//
//  ChartData.swift
//  ChartSwiftUI
//
//  Created by DREAMWORLD on 21/03/24.
//

import Foundation

struct ChartData: Identifiable, Equatable {
    let type: String
    let count: Int

    var id: String { return type }
}


struct PetData: Identifiable, Equatable {
    var id = UUID()
    
    let year: Int
    let population: Double
}


let catExamples: [PetData] = [PetData(year: 2000, population: 6.8),
                          PetData(year: 2010, population: 8.2),
                          PetData(year: 2015, population: 12.9),
                          PetData(year: 2022, population: 15.2)]

let dogExamples: [PetData] = [PetData(year: 2000, population: 5),
                          PetData(year: 2010, population: 5.3),
                          PetData(year: 2015, population: 7.9),
                          PetData(year: 2022, population: 10.6)]

let birdExamples: [PetData] = [PetData(year: 2000, population: 15.8),
                          PetData(year: 2010, population: 18.3),
                          PetData(year: 2015, population: 10.9),
                          PetData(year: 2022, population: 8.6)]

struct PetDataSeries: Identifiable {
    let type: String
    let petData: [PetData]
    var id: String { type }
}

