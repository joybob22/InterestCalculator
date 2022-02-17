//
//  PieChartData.swift
//  InterestCalculator
//
//  Created by Luis Madriz on 2/3/22.
//

import Foundation
import SwiftUI



struct ChartData {
   
    var id = UUID()
    var color : Color
    var percent : CGFloat
    var value : CGFloat
    
}



class ChartDataContainer : ObservableObject {
    @Published var chartData =
    [
            ChartData(color: Color(#colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)), percent : 45, value: 0),
            ChartData(color: Color(#colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)), percent: 55, value: 0),
            //ChartData(color: Color(#colorLiteral(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315, alpha: 1)), percent: 40, value: 0),
            //ChartData(color: Color(#colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)), percent: 35, value: 0)]
            ]
    
    func calc() {
        var value : CGFloat = 0
        
        for i in 0..<chartData.count {
            value += chartData[i].percent
            chartData[i].value = value
        }
    }
    
}

struct PieChart : View {
    @ObservedObject var charDataObj = ChartDataContainer()
    @State var indexOfTappedSlice = -1
    var body: some View {
        VStack {
            //MARK:- Pie Slices
            ZStack {
                ForEach(0..<charDataObj.chartData.count) { index in
                    Circle()
                        .trim(from: index == 0 ? 0.0 : charDataObj.chartData[index-1].value/100,
                              to: charDataObj.chartData[index].value/100)
                        .stroke(charDataObj.chartData[index].color,lineWidth: 100)
                        .scaleEffect(index == indexOfTappedSlice ? 1.1 : 1.0)
                        //.animation(.spring())
                }
            }.frame(width: 100, height: 200)
            .onAppear() {
                self.charDataObj.calc()
            }
            
            ForEach(0..<charDataObj.chartData.count) { index in
                           HStack {
                               Text(String(format: "%.2f", Double(charDataObj.chartData[index].percent))+"%")
                                   .onTapGesture {
                                       indexOfTappedSlice = indexOfTappedSlice == index ? -1 : index
                                   }
                                   .font(indexOfTappedSlice == index ? .headline : .subheadline)
                               RoundedRectangle(cornerRadius: 3)
                                   .fill(charDataObj.chartData[index].color)
                                   .frame(width: 15, height: 15)
                           }
                       }
                       .padding(8)
                       .frame(width: 300, alignment: .trailing)
            
        }
    }
}
