//
//  ChangePasswordView.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-04-03.
//

import SwiftUI

struct ChangePasswordView: View {
    @ObservedObject var readViewModel = ReadFromDatabase()
    
    @State var UTorID: String = ""
    
    @State private var currentPassword: String = ""
    @State private var newPassword: String = ""
    @State private var confirmNewPassword: String = ""
    
    @State private var showingAlert = false
    @State private var passwordChanged = false
    @State private var incorCurrPassAlert = false
    @State private var newPasswordMatchAlert = false
    
    var body: some View {
        
        VStack{
            TextField("Current Password",
                      text: $currentPassword)
            .textFieldStyle(.roundedBorder)
            .autocapitalization(.none)
            .font(.custom(
                    "FontNameRound",
                    fixedSize: 20))
            .frame(width: 300, height: 50, alignment: .center)
            .border(.black)
            
            TextField("New Password",
                      text: $newPassword)
            .textFieldStyle(.roundedBorder)
            .autocapitalization(.none)
            .font(.custom(
                    "FontNameRound",
                    fixedSize: 20))
            .frame(width: 300, height: 50, alignment: .center)
            .border(.black)
            
            TextField("Confirm New Password",
                      text: $confirmNewPassword)
            .textFieldStyle(.roundedBorder)
            .autocapitalization(.none)
            .font(.custom(
                    "FontNameRound",
                    fixedSize: 20))
            .frame(width: 300, height: 50, alignment: .center)
            .border(.black)
            
            
            VStack {
                Button {
                    if currentPassword == "" {
                        showingAlert = true
                    }
                    else if newPassword == "" {
                        showingAlert = true
                    }
                    else if confirmNewPassword == "" {
                        showingAlert = true
                    }
                    else {
                        let currPass = readViewModel.singleLogin?.password
                    
                        if currPass != self.currentPassword{
                            incorCurrPassAlert = true
                        }
                        else if (self.newPassword != self.confirmNewPassword){
                            newPasswordMatchAlert = true
                        }
                        else{
                            let exec = self.readViewModel.exec
                            let w = WriteExec(exec: exec!)
                            w.writeLogin(password: newPassword)
                            passwordChanged = true
                    
                        }
                            
                    }
                } label: {
                    Text("Change Password")
                        .font(.custom("SF Pro", size: 22))
                }
                
            }
            .alert("Please complete all fields", isPresented: $showingAlert) {
                Button("OK", role: .cancel) {
                    showingAlert = false
                }
            }
            .alert("Incorrect current password", isPresented: $incorCurrPassAlert){
                Button("OK", role: .cancel) {
                    incorCurrPassAlert = false
                }
            }
            .alert("Two passwords do not match", isPresented: $newPasswordMatchAlert){
                Button("OK", role: .cancel) {
                    newPasswordMatchAlert = false
                }
            }
            .alert("Password Changed Successfully", isPresented: $passwordChanged) {
                Button("OK", role: .cancel) {
                    passwordChanged = false
                }
            }
            .frame(width: 280, height: 50, alignment: .center)
            .buttonStyle(RoundedRectangleButtonStyle())
                
        }
        .onAppear(){
            self.readViewModel.fetchSingleLoginCred(childKey: UTorID){done in
                self.readViewModel.generateExec(childKey: "Executive/\(self.UTorID)") {complete in
                }
            }
        }
    }
}


struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordView(UTorID: "faisalf4")
    }
}
