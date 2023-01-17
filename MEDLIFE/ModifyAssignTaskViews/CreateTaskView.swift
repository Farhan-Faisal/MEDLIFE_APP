//
//  CreateTaskView.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-01-17.
//

import SwiftUI

// Need to account for duplicate tasks
// Need to enabletask deletion
// Need to enable task modification

struct CreateTaskView: View {
    @State var exec: Executive
    
    @State private var taskName: String = ""
    @State private var taskID: String = ""
    @State private var deadline = Date.now
    
    @State private var showingAlert = false
    @State private var taskAssigned = false
    
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
            
            
            TextField("Task ID",
                      text: $taskID)
            .textFieldStyle(.roundedBorder)
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

                    else if taskID == "" {
                        showingAlert = true
                    }
                    else {
                        let temp = Task(id: taskID, execID: exec.id, name: taskName, deadline: deadline, completed: false, approved: false)
                        
                        let w = WriteTask(task: temp)
                        w.write()
                        
                        taskAssigned = true
                    }
                } label: {
                    Text("Create and Assign")
                }
                .alert("Please complete all fields", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) {
                        showingAlert = false
                    }
                }
                .alert("Task created successfully", isPresented: $taskAssigned) {
                    Button("OK", role: .cancel) {
                        taskAssigned = false
                    }
                }
                .frame(width: 280, height: 50, alignment: .center)
                .buttonStyle(RoundedRectangleButtonStyle())
                
            }
        }
        
        
    }
}
