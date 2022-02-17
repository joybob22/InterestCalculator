//
//  PieChartData.swift
//  InterestCalculator
//
//  Created by Luis Madriz on 2/3/22.
//

import Foundation
import SwiftUI



struct ChartData: Identifiable {
   
    var id = UUID()
    var color : Color
    var percent : CGFloat
    var value : CGFloat = 0
    var lastValue : CGFloat = 0
    var title : String
}



class ChartDataContainer : ObservableObject {
    @Published var chartData =
    [
            ChartData(color: Color(#colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)), percent : 45, title: ""),
            ChartData(color: Color(#colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)), percent: 55, title: ""),
            //ChartData(color: Color(#colorLiteral(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315, alpha: 1)), percent: 40, value: 0),
            //ChartData(color: Color(#colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)), percent: 35, value: 0)]
            ]
    
    init(chartData: [ChartData]) {
        self.chartData = chartData
    }
    
    func calc() {
        var value : CGFloat = 0
        
        for i in 0..<chartData.count {
            chartData[i].lastValue = value
            value += chartData[i].percent
            chartData[i].value = value
        }
    }
    
}

struct PieChart : View {
    @ObservedObject var charDataObj: ChartDataContainer
    @State var indexOfTappedSlice = -1
    var body: some View {
        VStack {
            //MARK:- Pie Slices
            ZStack {
                ForEach(charDataObj.chartData) { data in
                    Circle()
                        .trim(from: data.lastValue/100,
                              to: data.value/100)
                        .stroke(data.color,lineWidth: 100)
//                        .scaleEffect(index == indexOfTappedSlice ? 1.1 : 1.0)
                        //.animation(.spring())
                }
            }.frame(width: 100, height: 200)
            .onAppear() {
                self.charDataObj.calc()
            }
            
            ForEach(charDataObj.chartData) { data in
                           HStack {
                               Text("\(data.title): \(String(format: "%.2f", Double(data.percent)))%")
//                                   .onTapGesture {
//                                       indexOfTappedSlice = indexOfTappedSlice == index ? -1 : index
//                                   }
//                                   .font(indexOfTappedSlice == index ? .headline : .subheadline)
                               RoundedRectangle(cornerRadius: 3)
                                   .fill(data.color)
                                   .frame(width: 15, height: 15)
                           }
                       }
                       .padding(8)
                       .frame(width: 300, alignment: .trailing)
            
        }
    }
}
