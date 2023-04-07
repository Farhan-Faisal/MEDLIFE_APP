//
//  UploadPictureView.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-03-11.
//

import SwiftUI
import PhotosUI

struct UploadPictureView: View {
    
    // Need to learn how to dismiss the view
    
    @State var task: TaskModel
    
    @State private var selectedItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()
    @State private var selectedUIImages = [UIImage]()
    
//    @State private var backToTaskList: Bool = false
    @State private var proofUploaded: Bool = false
    @State private var proofNotUploaded: Bool = false
    
    var body: some View {
                VStack {
                    Section {
                        VStack(alignment: .trailing){
                            Button{
                                if selectedItems.count == 0 {
                                    proofUploaded = false
                                    proofNotUploaded = true
                                }
                                else {
                                    let m = StorageManager()
                                    
                                    var counter = 0
                                    for item in selectedUIImages {
                                        m.upload(image: item, uploadName: String(counter), execID: task.execID, taskID: task.id)
                                        counter = counter + 1
                                    }
                                    proofNotUploaded = false
                                    proofUploaded = true
                                }
                            }label: {
                                Text("Upload")
                            }
                            .alert("Please upload an image first!", isPresented: $proofNotUploaded) {
                                Button("OK", role: .cancel) {
                                    proofNotUploaded = false
                                }
                            }
                            .alert("Upload Complete", isPresented: $proofUploaded) {
                                Button("OK", role: .cancel) {
                                    let m = StorageManager()
                                    m.listAllFiles(execID: task.execID, taskID: task.id)
                                    proofUploaded = false
                                }
                            }
                        }
                    }
                    Section{
                        List {
                            ForEach(0..<selectedImages.count, id: \.self) { i in
                                selectedImages[i]
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 300, height: 200)
                            }
                            .onDelete { offsets in
                                selectedImages.remove(atOffsets: offsets)
                            }
                        }
                        .toolbar {
                            PhotosPicker("Select images", selection: $selectedItems, matching: .images)
                        }
                        .onChange(of: selectedItems) { _ in
                            Task {
                                selectedImages.removeAll()
                                
                                for item in selectedItems {
                                    if let data = try? await item.loadTransferable(type: Data.self) {
                                        if let uiImage = UIImage(data: data) {
                                            let image = Image(uiImage: uiImage)
                                            selectedImages.append(image)
                                            selectedUIImages.append(uiImage)
                                        }
                                    }
                                }
                            }
                        }
                    }       
        }
    }
}

struct UploadPictureView_Previews: PreviewProvider {
    static var previews: some View {
        let m = TaskModel(id: "test123", execID: "exec123", name: "TestTask", deadline: Date(), description: "kjkjk", completed: false, approved: false)
        UploadPictureView(task: m)
    }
}
