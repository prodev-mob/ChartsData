//
//  LineChartView.swift
//  ChartSwiftUI
//
//  Created by DREAMWORLD on 19/03/24.
//

import SwiftUI
import Charts

struct LineChartView: View {

    var data: [PetDataSeries] {
        [PetDataSeries(type: "Cat", petData: catExamples),
         PetDataSeries(type: "Dog", petData: dogExamples),
         PetDataSeries(type: "Bird", petData: birdExamples)]
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                Chart(data, id: \.type) { dataSeries in
                           ForEach(dataSeries.petData) { data in
                               LineMark(x: .value("Year", data.year),
                                        y: .value("Population", data.population))
                           }
                           .foregroundStyle(by: .value("Pet type", dataSeries.type))
                           .symbol(by: .value("Pet type", dataSeries.type))
                       }
                       .chartXScale(domain: 1998...2024)
                       .chartYScale(domain: 0...20)
                       .aspectRatio(1, contentMode: .fit)
                       .padding()
                
            }
            .padding()
            .navigationTitle("Line Graph")
        }
    }

}

struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartView()
    }
}
