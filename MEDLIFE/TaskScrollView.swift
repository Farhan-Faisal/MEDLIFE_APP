//
//  TaskScrollView.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-01-14.
//

import SwiftUI

struct TaskScrollView: View {
    
    @ObservedObject var readViewModel = ReadFromDatabase()
    
    var body: some View {
        NavigationView{
            List(readViewModel.taskList, id: \.self){task in
                TaskListComponentView(task: task)
            }
            
            .frame(width: 450, alignment: .leading)
            .background(Color.white)
            .onAppear(){
                self.readViewModel.getAllChildKeys(childKey: "Tasks/faisalf4"){complete in
                    let keys = self.readViewModel.fetchedKeys
                    self.readViewModel.generateTaskList(execID: "faisalf4", keys: keys){fin in
                    }
                }
            }
            .navigationBarTitle("Task List")
            .font(.system(size: 20))
        }

    }
}

struct TaskScrollView_Previews: PreviewProvider {
    static var previews: some View {
        TaskScrollView()
    }
}
