//
//  BarChartView.swift
//  ChartSwiftUI
//
//  Created by DREAMWORLD on 21/03/24.
//

import SwiftUI
import Charts

struct BarChartView: View {
    @State private var averageIsShown = false
    let data = [ChartData(type: "bird", count: 20),
                ChartData(type: "dog", count: 12),
                ChartData(type: "cat", count: 8)]
    
    var maxChartData: ChartData? {
        data.max { $0.count < $1.count }
    }
    
    var average: Double {
        let counts = data.compactMap { d in
            d.count
        }
        let sumArray = counts.reduce(0, +)

        let avgArrayValue = Double(sumArray) / Double(counts.count)
        return avgArrayValue
    }
    
    var body: some View {
        NavigationStack{
            VStack {
                Chart {
                    ForEach(data) { dataPoint in
                        BarMark(x: .value("Type", dataPoint.type),
                                y: .value("Population", dataPoint.count))
                        .opacity(maxChartData == dataPoint ? 1 : 0.5)
                        .foregroundStyle(maxChartData == dataPoint ? Color.accentColor : Color.gray)
                    }
                    
                    if averageIsShown {
                        RuleMark(y: .value("Average", average))
                            .foregroundStyle(.gray)
                            .annotation(position: .bottom,
                                        alignment: .bottomLeading) {
                                Text("average \(String(format: "%.2f", average))")
                            }
                    }
                    
                }
                .aspectRatio(1, contentMode: .fit)
                
                Toggle(averageIsShown ? "show average" : "hide average",
                       isOn: $averageIsShown.animation())
            }
            .padding()
            .navigationTitle("Bar chart")
        }
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView()
    }
}



