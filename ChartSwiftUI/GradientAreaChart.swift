//
//  GradientAreaChart.swift
//  ChartSwiftUI
//
//  Created by DREAMWORLD on 21/03/24.
//

import SwiftUI
import Charts

struct GradientAreaChart: View {
    let numbers: [Double]
    var average: Double {
        let sumArray = numbers.reduce(0, +)
        let avgArrayValue = Double(sumArray) / Double(numbers.count)
        return avgArrayValue
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                Chart {
                    ForEach(Array(numbers.enumerated()), id: \.offset) { index, value in
                      
                        PointMark(
                            x: .value("Index", index),
                            y: .value("Value", value)
                        )
                        .foregroundStyle(value < average ? .red : .green)
                        
                        AreaMark(
                            x: .value("Index", index),
                            y: .value("Value", value)
                        )
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(linearGradient)
                    }
                    RuleMark(y: .value("Limit", average))
                        .foregroundStyle(.red)
                }
            }
            .padding()
            .navigationTitle("GradientArea Chart")
        }
    }
    
    let linearGradient = LinearGradient(gradient: Gradient(colors: [Color.accentColor.opacity(0.4), Color.accentColor.opacity(0)]),
                                        startPoint: .top,
                                        endPoint: .bottom)
}

struct GradientAreaChart_Previews: PreviewProvider {
    static var previews: some View {
        GradientAreaChart(numbers: [32.0, 22.0, 35.0, 50.0, 35.0, 18.0, 15.0])
    }
}
