//
//  ExecHomeView.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-01-08.
//

import SwiftUI

struct ExecEventView: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("Upcoming events go here")
                
                NavigationLink(destination: temp()){
                    Text("Go to another View")
                        .fontWeight(.medium)
                }
            }
            .navigationTitle("Upcoming Events")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ExecEventView_Previews: PreviewProvider {
    static var previews: some View {
        ExecEventView()
    }
}
