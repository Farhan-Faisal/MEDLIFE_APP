//
//  ModifyTaskView.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-01-17.
//

import SwiftUI

struct ModifyTaskView: View {

    @State var task: Task
    @State private var taskName: String = ""
    @State private var deadline = Date.now
    
    @State private var showingAlert = false
    @State private var taskModified = false
    
    var body: some View {
        
        VStack{
            TextField("Task Name",
                      text: $taskName)
            .textFieldStyle(.roundedBorder)
            .font(.custom(
                    "FontNameRound",
                    fixedSize: 20))
            .frame(width: 300, height: 50, alignment: .center)
            .border(.black)
            
            
            DatePicker(selection: $deadline, in: ...Date.now, displayedComponents: .date) {
                Text("Deadline")
            }
            .frame(width: 280, height: 50, alignment: .center)
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 2, trailing: 10))
            .border(.black)
            
            VStack {
                Button {
                    if taskName == "" {
                        showingAlert = true
                    }

                    else {
                        
                        let tempRef = ReadFromDatabase().ref.child("Tasks").child(task.execID).child(task.id)
                        tempRef.removeValue()
                        
                        let temp = Task(id: task.id, execID: task.execID, name: taskName, deadline: deadline, completed: false, approved: false)
                        let w = WriteTask(task: temp)
                        w.write()
                        
                        taskModified = true
                    }
                } label: {
                    Text("Create and Assign")
                }
                .alert("Please complete all fields", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) {
                        showingAlert = false
                    }
                }
                .alert("Task modified successfully", isPresented: $taskModified) {
                    Button("OK", role: .cancel) {
                        taskModified = false
                    }
                }
                .frame(width: 280, height: 50, alignment: .center)
                .buttonStyle(RoundedRectangleButtonStyle())
                
            }
        }
        
        
    }
}

struct ModifyTaskView_Previews: PreviewProvider {
    static var previews: some View {
        let m = Task(id: "test123", execID: "exec123", name: "TestTask", deadline: Date(), completed: false, approved: false)
        ModifyTaskView(task: m)
    }
}
