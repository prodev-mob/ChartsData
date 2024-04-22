//
//  PieChartView.swift
//  ChartSwiftUI
//
//  Created by DREAMWORLD on 19/03/24.
//

import SwiftUI
import Charts
//MARK: Pie is available for xcode 15

struct PieChartView: View {
    var body: some View {
        NavigationStack{
            VStack{
//                Chart {
//                    ForEach(MockData.revenues) { stream in
//                        SectorMark(angle: .value("Value", stream.value))
//                            .foregroundStyle(by: .value("Product category", stream.name))
//
//                    }
//                }
            }
            .padding()
            .navigationTitle("Pie Chart")
        }
    }
}

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView()
    }
}

struct RevenueStream: Identifiable{
    var id = UUID()
    var name: String
    var value: Int
}
struct MockData{
    static var revenues: [RevenueStream] = [
        .init(name: "Sales", value: 680000),
        .init(name: "Burn", value: 350000),
        .init(name: "Gross", value: 50000),
        .init(name: "EBITA", value: 160000)]
}


