//
//  ModifyDeleteScrollView.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-01-17.
//

import SwiftUI

struct ExecTaskScrollView: View {
    @ObservedObject var readViewModel = ReadFromDatabase()
    @State var executive: Executive
    @State var goToCreateTask: Bool = false
    
    @State var firstName: String = ""
    
    var body: some View {
        NavigationView{
            List{
                ForEach(readViewModel.taskList, id: \.self){task in
                    ExecTaskComponentView(task: task)
                }
                .onDelete { offsets in
                    for index in offsets{
                        let tempRef = readViewModel.ref.child("Tasks/\(executive.id)").child(readViewModel.taskList[index].id)
                        tempRef.removeValue()
                    }
                    readViewModel.taskList.remove(atOffsets: offsets)
                }
            }
            .frame(width: 400, alignment: .leading)
            .background(Color.white)
            .onAppear(){
                self.readViewModel.getAllChildKeys(childKey: "Tasks/\(executive.id)"){complete in
                    let keys = self.readViewModel.fetchedKeys
                    self.readViewModel.generateTaskList(execID: executive.id, keys: keys){fin in
                    }
                }
                
                let first = executive.name.firstIndex(of: " ")!
                self.firstName = String(executive.name[...first])

            }
            .navigationBarTitle("\(firstName)'s Tasks")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        goToCreateTask = true
                    }, label: {
                        Image(systemName: "plus.square")
                            .imageScale(.large)
                    })
                    .navigationDestination(isPresented: $goToCreateTask) {
                        CreateTaskView(exec: executive)
                    }
                }
            }
        }

    }
}

//struct ModifyDeleteScrollView_Previews: PreviewProvider {
//    static var previews: some View {
//        let m = Task(id: "test123", execID: "exec123", name: "TestTask", deadline: Date(), completed: false, approved: false)
//        ModifyDeleteScrollView(m)
//    }
//}
