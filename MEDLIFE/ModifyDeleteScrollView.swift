//
//  ModifyDeleteScrollView.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-01-17.
//

import SwiftUI

struct ModifyDeleteScrollView: View {
    @ObservedObject var readViewModel = ReadFromDatabase()
    @State var executive: Executive
    
    var body: some View {
        NavigationView{
            List(readViewModel.taskList, id: \.self){task in
                ModifyDeleteTaskComponentView(task: task)
            }
            .frame(width: 450, alignment: .leading)
            .background(Color.white)
            .onAppear(){
                self.readViewModel.getAllChildKeys(childKey: "Tasks/\(executive.id)"){complete in
                    let keys = self.readViewModel.fetchedKeys
                    self.readViewModel.generateTaskList(execID: executive.id, keys: keys){fin in
                    }
                }
            }
            .navigationBarTitle("Modify Tasks")
            .navigationBarTitleDisplayMode(.inline)
        }

    }
}

//struct ModifyDeleteScrollView_Previews: PreviewProvider {
//    static var previews: some View {
//        let m = Task(id: "test123", execID: "exec123", name: "TestTask", deadline: Date(), completed: false, approved: false)
//        ModifyDeleteScrollView(m)
//    }
//}
