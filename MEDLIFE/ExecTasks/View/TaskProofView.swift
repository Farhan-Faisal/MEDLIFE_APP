//
//  TaskProofView.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-03-19.
//

import SwiftUI

struct TaskProofView: View {
    @ObservedObject var storageManager = StorageManager()
    @State var task: TaskModel = TaskModel(id: "test789", execID: "faisalf4", name: "TestTask", deadline: Date(), description: "jjkjk", completed: false, approved: false)
    
    var body: some View {
        NavigationView{
            List {
                ForEach(0..<storageManager.retrievedImages.count, id: \.self) { i in
                    Image(uiImage: storageManager.retrievedImages[i])
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 200)
                }
                .onDelete { offsets in
                    storageManager.retrievedImages.remove(atOffsets: offsets)
                }
            }
            .onAppear(){
                self.storageManager.downloadImages(execID: task.execID, taskID: task.id)
            }
            .navigationBarTitle("Proof for task: \(task.name)")
            .navigationBarTitleDisplayMode(.inline)
        }

    }
}

struct TaskProofView_Previews: PreviewProvider {
    static var previews: some View {
        let m = TaskModel(id: "test789", execID: "faisalf4", name: "TestTask", deadline: Date(), description: "jkkjk", completed: false, approved: false)
        TaskProofView(task: m)
    }
}
