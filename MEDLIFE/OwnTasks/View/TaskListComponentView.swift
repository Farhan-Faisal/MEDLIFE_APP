//
//  TaskListComponentView.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-01-13.
//

import SwiftUI


struct statusText: View {
    @State var status: String;
    @State var color = Color.red;
    
    var body: some View{
        Text(status)
            .frame(width: 60, height: 60)
            .font(.system(size: 15))
            .fontWeight(.bold)
            .foregroundColor(Color.black)
            .background(color)
            .clipShape(Circle())
    }
}


struct TaskListComponentView: View {
    @ObservedObject var readViewModel = ReadFromDatabase()
    @State var task: TaskModel
    @State var showEdit: Bool = false
    @State var uploadProof: Bool = false
    
    var body: some View {
            HStack{
                VStack(alignment: .leading){
                    Text(task.name)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .padding(EdgeInsets(top: 0.1, leading: 5, bottom: 0.2, trailing: 0))
                    
                    Text("Deadline: \(task.deadline.formatted(date: .long, time: .omitted))")
                        .foregroundColor(.black)
                        .font(.system(size: 18))
                        .padding(EdgeInsets(top: 0.1, leading: 5, bottom: 0.2, trailing: 0))
                    
                    if task.completed == true{
                        Text("Status: Pending Approval")
                            .frame(width: 215, height: 10, alignment: .leading)
                            .padding(EdgeInsets(top: 0.1, leading: 5, bottom: 0.2, trailing: 0))
                    }
                    else{
                        Text("Status: Pending Completion")
                            .frame(width: 215, height: 10, alignment: .leading)
                            .padding(EdgeInsets(top: 0.1, leading: 5, bottom: 0.2, trailing: 0))
                    }
                }.frame(width: 250, height: 125)
                
                
                VStack(alignment: .trailing){
                    Button{
                        if task.completed == false {
                            task.completed = true
                            let w = WriteTask(task: task)
                            w.write()
                            uploadProof = true
                        }
                        else if task.completed == true {
                            task.completed = false
                            let w = WriteTask(task: task)
                            w.write()
                        }
                        
                    }label: {
                        if task.completed == true {
                            statusText(status: "Undo", color: Color.red)
                        }
                        else if task.completed == false {
                            statusText(status: "Upload", color: Color.green)
                        }
                    }
                    .navigationDestination(isPresented: $uploadProof) {
                        UploadPictureView(task: task)
                    }
                }.frame(width: 100, height: 100)
            }
            .onAppear(){
                uploadProof = false
            }
        
    }
}





struct TaskListComponentView_Previews: PreviewProvider {
    static var previews: some View {
        let m = TaskModel(id: "test123", execID: "exec123", name: "TestTask", deadline: Date(), description: "njkjkn", completed: false, approved: false)
        TaskListComponentView(task: m)
        
    }
}
