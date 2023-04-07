//
//  ModifyDeleteTaskView.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-01-17.
//

import SwiftUI

struct ExecTaskComponentView: View {

    @State var readViewModel = ReadFromDatabase()
    @State var task: TaskModel
    
    @State var goToModify = false
    @State var goToProofs = false
    @State var goToDescription = false
    
    var body: some View {

        VStack(alignment: .leading){
            Text(task.name)
                .foregroundColor(.black)
                .fontWeight(.bold)
                .font(.system(size: 20))
                .padding(EdgeInsets(top: 0.1, leading: 0, bottom: 0.2, trailing: 0))
            
            Text("Deadline: \(task.deadline.formatted(date: .long, time: .omitted))")
                .foregroundColor(.black)
                .font(.system(size: 18))
                .padding(EdgeInsets(top: 0.1, leading: 2, bottom: 0.2, trailing: 0))

            Text("ID: \(task.id)")
                .foregroundColor(.black)
                .font(.system(size: 18))
                .padding(EdgeInsets(top: 0.1, leading: 3, bottom: 0.2, trailing: 0))
            
        }
        .frame(width: 300, height: 125, alignment: .leading)
        .navigationDestination(isPresented: $goToModify) {
            ModifyTaskView(task: task)
        }
        .navigationDestination(isPresented: $goToProofs) {
            TaskProofView(task: task)
        }

        .contextMenu {
           Button {
               goToModify = true
           } label: {
               Label("Modify Task", systemImage: "gear")
           }
            
            Button {
                goToProofs = true
            } label: {
                Label("View Proofs", systemImage: "eye")
            }
            
            Button {
                goToDescription = true
            } label: {
                Label("View Description", systemImage: "eye")
            }
       }
    }
}

struct ExecTaskComponentView_Previews: PreviewProvider {
    static var previews: some View {
        let m = TaskModel(id: "test123", execID: "exec123", name: "TestTask", deadline: Date(), description: "jkjiik", completed: false, approved: false)
        ExecTaskComponentView(task: m)
    }
}

