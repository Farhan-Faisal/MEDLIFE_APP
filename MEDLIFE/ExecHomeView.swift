//
//  ExecHomeView.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-01-08.
//

import SwiftUI

enum Tabs: String {
    case events
    case tasks
    case executives
    case settings
}

struct ExecHomeView: View {
    
    @ObservedObject var readViewModel = ReadFromDatabase()
    @State var UTorID: String
    @State var selectedTab: Tabs = .events
    
    var body: some View {
            TabView(selection: $selectedTab){
                ExecEventView(ExecID: UTorID)
                    .tabItem({
                        Label("Events", systemImage: "calendar")
                    })
                    .tag(Tabs.events)
                
                
                TaskScrollView()
                    .tabItem({
                        Label("Tasks", systemImage: "note")
                    })
                    .tag(Tabs.tasks)
                
                ExecScrollView()
                    .tabItem({
                        Label("Execs", systemImage: "person.2")
                    })
                    .tag(Tabs.executives)
                
                SettingsView(UTorID: UTorID)
                    .tabItem({
                        Label("Settings", systemImage: "gear")
                    })
                    .tag(Tabs.settings)
            }
//        }
//        .navigationBarTitle(selectedTab.rawValue.capitalized)
        .navigationBarBackButtonHidden(true)
    }
}

//struct ExecHomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExecHomeView()
//    }
//}
