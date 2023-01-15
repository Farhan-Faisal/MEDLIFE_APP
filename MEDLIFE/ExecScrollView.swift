//
//  ExecScrollView.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-01-13.
//

import SwiftUI

struct ExecScrollView: View {
    @ObservedObject var readViewModel = ReadFromDatabase()
    
    var body: some View {
         
        NavigationView{
            
            List(readViewModel.execList, id: \.self){exec in
                NavigationLink(destination: ExecListComponetView(exec: exec)) {
                    ExecListComponetView(exec: exec)
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
            .navigationBarTitle("Executive List")
            .navigationBarTitleDisplayMode(.inline)
            .font(.system(size: 10))
        }
        .background(Color.white)
    }
}
