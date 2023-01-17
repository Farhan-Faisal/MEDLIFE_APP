//
//  ModifyDeleteTaskView.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-01-17.
//

import SwiftUI

struct ModifyDeleteTaskComponentView: View {

    @State var readViewModel = ReadFromDatabase()
    @State var task: Task
    
    @State var goToModify = false
    @State var reallyDelete = false
    
    var body: some View {

        VStack(alignment: .leading){
            
            VStack(alignment: .leading){
                Text(task.name)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .frame(width: 300, height: 20, alignment: .leading)
                    .font(.system(size: 20))
                
                Text("Deadline: \(task.deadline.formatted(date: .long, time: .omitted))")
                    .foregroundColor(.black)
                    .frame(width: 300, height: 20, alignment: .leading)
                    .font(.system(size: 18))

                Text("ID: \(task.id)")
                    .foregroundColor(.black)
                    .frame(width: 300, height: 20, alignment: .leading)
                    .font(.system(size: 18))
            }
            .padding(.leading, 5)
                
            HStack{
                VStack {
                    Button {
                        reallyDelete = true
                    } label: {
                        Text("Delete Task")
                    }
                }
                .confirmationDialog("Are you sure?", isPresented: $reallyDelete) {
                    Button("Yes", role: .destructive) {
                        let tempRef = readViewModel.ref.child("Tasks").child(task.execID).child(task.id)
                        tempRef.removeValue()
                    }
                }
                .buttonStyle(ModifyButtonStyle())
                
                VStack {
                    Button {
                        goToModify = true
                    } label: {
                        Text("Modify Task")
                    }
                }
                .navigationDestination(isPresented: $goToModify) {
                    ModifyTaskView(task: task)
                }
                .buttonStyle(ModifyButtonStyle())
            }
        }
    }
}

struct ModifyDeleteTaskComponentView_Previews: PreviewProvider {
    static var previews: some View {
        let m = Task(id: "test123", execID: "exec123", name: "TestTask", deadline: Date(), completed: false, approved: false)
        ModifyDeleteTaskComponentView(task: m)
    }
}


struct ModifyButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    HStack {
      Spacer()
      configuration.label.foregroundColor(.white)
      Spacer()
    }
    .font(.system(size: 16))
    .fontWeight(.medium)
    .foregroundColor(.white)
    .frame(width: 150, height: 25, alignment: .center)
    .background(.black)
    .padding(5)
  }
}

