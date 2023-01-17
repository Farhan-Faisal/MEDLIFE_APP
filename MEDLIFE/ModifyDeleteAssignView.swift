//
//  ModifyDeleteAssignView.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-01-17.
//

import SwiftUI

struct ModifyDeleteAssignView: View {
    
    @State var exec: Executive

    var body: some View {
        TabView{
            CreateTaskView(exec: exec)
                .tabItem({
                    Label("Assign Task", systemImage: "note")
                })
            
            ModifyDeleteScrollView(executive: exec)
                .tabItem({
                    Label("Modify Task", systemImage: "note")
                })
        }
        .navigationBarTitle("Modify/Delete/Assign")
        .backgroundStyle(.black)
    }
}
