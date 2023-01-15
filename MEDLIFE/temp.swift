//
//  temp.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-01-02.
//

import SwiftUI

//NavigationStack {
//        VStack(spacing: 20) {
//            NavigationLink("Navigate: String Value", value: "New Page")
//
//            NavigationLink("Navigate: Int Value", value: 1)
//
//            ForEach(fruits, id:\.self) { fruit in
//                NavigationLink(fruit, value: fruit)
//            }
//        }
//        .navigationDestination(for: String.self) { value in
//            Text("New screen")
//            Text("Value is String -> \(value)")
//        }
//        .navigationDestination(for: Int.self) { value in
//            Text("New screen")
//            Text("Value is Integer -> \(value)")
//        }
//    }
//}

struct temp: View {
    
    //    @State var selectedDate = Date()
    //    var dateClosedRange: ClosedRange<Date> {
    //        let min = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
    //        let max = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
    //        return min...max
    //    }
        

//    let m = Task(id: "test789", execID: "faisalf4", name: "TestTask", deadline: Date(), completed: false, approved: false)
//    let n = Executive(id: "danielle", name: "Danielle Nanquil", position: "Secretary", email: "danielle.nanquil@mail.utoronto.ca")
//
//    let execDB = WriteExec(exec: n)
//    execDB.write();
//
//    let taskDB = WriteTask(task: m)
//    taskDB.write()
    
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
