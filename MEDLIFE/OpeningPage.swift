//
//  OpeningPage.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2022-12-30.
//

import SwiftUI

struct OpeningPage: View {
   @ObservedObject var readViewModel = ReadFromDatabase()
    
    @State private var goesToDetail: Bool = false
    
    var body: some View {
       
        VStack {
            
            Image("MedlifeLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text("MEDLIFE UTSC")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .padding()
        
            VStack {
                //                NavigationLink(
                //                    destination: ExecHomeView(),
                //                    isActive: $goesToDetail
                //                )
                //                {
                //                    Button(action: {goesToDetail = true})
                //                    {
                //                        Text("Next")
                //                    }
                //                }
                
                Button("EXEC LOGIN") {
                    
                    let m = Task(id: "test789", execID: "faisalf4", name: "TestTask", deadline: Date(), completed: false, approved: false)
                    let n = Executive(id: "danielle", name: "Danielle Nanquil", position: "Secretary", email: "danielle.nanquil@mail.utoronto.ca")
                    //
                    //                    let execDB = WriteExec(exec: n)
                    //                    execDB.write();
                    //
                    let taskDB = WriteTask(task: m)
                    taskDB.write()
                    //
                    //
                }
                //                .fontWeight(.medium)
                //                .foregroundColor(.white)
                //                .frame(width: 150, height: 30, alignment: .center)
                //                .background(.black)
                //                .padding(15)
                
                
                Button("MEMBER LOGIN") {
                    self.readViewModel.getAllChildKeys(childKey: "Executive"){complete in
                        let keys = self.readViewModel.fetchedKeys
                        
                        self.readViewModel.generateExecList(keys: keys){fin in
                            for item in self.readViewModel.execList {
                                print(item.name)
                            }
                        }
                    }
                    
                }
                .fontWeight(.medium)
                .foregroundColor(.white)
                .frame(width: 150, height: 30, alignment: .center)
                .background(.black)
                .padding(15)
            }
        }
    }
}

struct OpeningPage_Previews: PreviewProvider {
    static var previews: some View {
        OpeningPage()
    }
}
