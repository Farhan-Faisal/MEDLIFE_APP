//
//  TaskListComponentView.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-01-13.
//

import SwiftUI

struct TaskListComponentView: View {
    @State var task: Task
    @State var isComplete = false
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            HStack{
                Text(task.name)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
            }
            .padding(EdgeInsets(top: 0.1, leading: 10, bottom: 0.2, trailing: 0))
            
            
            VStack(alignment: .leading){
                Text("Deadline:   \(task.deadline.formatted(date: .long, time: .omitted))")
                    .foregroundColor(.black)
                    .font(.system(size: 18))
                    .padding(EdgeInsets(top: 0.1, leading: 10, bottom: 0.2, trailing: 0))
            }
            

            HStack{
                if isComplete{
                    Text("Status: Pending Approval")
                        .frame(width: 215, height: 10, alignment: .leading)
                }
                else{
                    Text("Status: Pending Completion")
                        .frame(width: 215, height: 10, alignment: .leading)
                }
                
                Text("ID:   \(task.id)")
                    .foregroundColor(.black)
                    .font(.system(size: 15))
                    .frame(width: 90, height: 10, alignment: .trailing)
                    .padding(EdgeInsets(top: 0.1, leading: 40, bottom: 0.2, trailing: 0))
            }
            .padding(EdgeInsets(top: 0.1, leading: 10, bottom: 0.2, trailing: 0))
            
            
            HStack{
                Toggle("Mark as complete", isOn: $isComplete)
                .padding(EdgeInsets(top: 0.1, leading: 10, bottom: 0.2, trailing: 10))
            }
        }
        .frame(width: 370, height: 150)
        .padding(EdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 2))
        .border(.black, width: 1)
    }
}

struct TaskListComponentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let m = Task(id: "test123", execID: "exec123", name: "TestTask", deadline: Date(), completed: false, approved: false)
        
        TaskListComponentView(task: m)
    }
}
