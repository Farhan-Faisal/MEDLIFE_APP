//
//  ExecHomeView.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-01-08.
//

import SwiftUI

struct ExecHomeView: View {
    
    @ObservedObject var readViewModel = ReadFromDatabase()
    
    var body: some View {
        
        TabView{
            ExecEventView()
                .tabItem({
                    Label("Events", systemImage: "house")
                })
            
            TaskScrollView()
                .tabItem({
                    Label("Tasks", systemImage: "note")
                })
                        
            ExecScrollView()
            .tabItem({
                Label("Execs", systemImage: "note")
            })
        }
        .navigationBarTitle("Executive List")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct ExecHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ExecHomeView()
    }
}
