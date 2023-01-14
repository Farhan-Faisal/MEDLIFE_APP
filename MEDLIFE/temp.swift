//
//  temp.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-01-02.
//

import SwiftUI

struct temp: View {
    
    //    @State var selectedDate = Date()
    //    var dateClosedRange: ClosedRange<Date> {
    //        let min = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
    //        let max = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
    //        return min...max
    //    }
        
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        //            Form{
        //                HStack{
        //                    DatePicker(
        //                        selection: $selectedDate,
        //                        in: dateClosedRange,
        //                        displayedComponents: .date,
        //                        label: { Text("Due Date") }
        //                    )
        //
        //                    Button(action: {
        //                        print("do something!")
        //
        //                    }){
        //                        HStack {
        //                            Image(systemName: "arrow.right.circle")
        //                            Text("Done")
        //                        }
        //                    }.padding(20)
        //                }
        //
        //                Text("Date is \(selectedDate.formatted(date: .long, time: .complete))")
        //            }
    }
}

struct temp_Previews: PreviewProvider {
    static var previews: some View {
        temp()
    }
}
