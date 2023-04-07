//
//  ExecScrollView.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-01-13.

// (readViewModel.execList, id: \.self){exec in

import SwiftUI

struct ExecScrollView: View {
    @ObservedObject var readViewModel = ReadFromDatabase()
    @State var addExec = false
    
    
    var body: some View {
        
        NavigationView{
            List{
                ForEach(readViewModel.execList, id: \.self){exec in
                    NavigationLink(destination: ExecTaskScrollView(executive: exec)) {
                        ExecListComponetView(exec: exec)
                    }
                }
                .onDelete { offsets in
                    for index in offsets{
                        let tempRef = readViewModel.ref.child("Executive").child(readViewModel.execList[index].id)
                        let loginRef = readViewModel.ref.child("Login").child(readViewModel.execList[index].id)
                        tempRef.removeValue()
                        loginRef.removeValue()
                    }
                    readViewModel.execList.remove(atOffsets: offsets)
                }
            }
            .frame(width: 400, alignment: .leading)
            .background(Color.white)
            .onAppear(){
                self.readViewModel.getAllChildKeys(childKey: "Executive"){complete in
                    let keys = self.readViewModel.fetchedKeys
                    self.readViewModel.generateExecList(keys: keys){fin in
                    }
                }
            }
            .navigationBarTitle("Executives")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        addExec = true
                    }, label: {
                        Image(systemName: "plus.square")
                            .imageScale(.large)
                    })
                    .navigationDestination(isPresented: $addExec) {
                        ExecCreationView()
                    }
                }
            }
        }
        .background(Color.black)
    }
}
