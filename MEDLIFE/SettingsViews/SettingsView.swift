//
//  SettingsView.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-01-19.
//

import SwiftUI


struct SettingsView: View {
    
    @State var UTorID: String = ""
    @State var signOut = false
    @State var changePassword = false
    
    var body: some View {
        VStack{
            VStack {
                Button {
                    changePassword = true
                } label: {
                    Text("Change Password")
                        .font(.custom("SF Pro", size: 22))
                }
            }
            .navigationDestination(isPresented: $changePassword){
                ChangePasswordView(UTorID: UTorID)
            }
            .buttonStyle(RoundedRectangleButtonStyle())
            
            VStack {
                Button {
                    signOut = true
                } label: {
                    Text("Sign Out")
                        .font(.custom("SF Pro", size: 22))
                }
            }
            .navigationDestination(isPresented: $signOut) {
                OpeningPage()
                    .navigationBarBackButtonHidden(true)
            }
            .buttonStyle(RoundedRectangleButtonStyle())
        }
        
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
