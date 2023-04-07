//
//  ExecCreationView.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-01-19.
//

import SwiftUI

struct ExecCreationView: View {
    @State private var execName: String = ""
    @State private var execUTorID: String = ""
    @State private var execPassword: String = ""
    @State private var execPosition: String = ""
    @State private var execEmail: String = ""
    
    @State private var showingAlert = false
    @State private var execCreated = false
    
    var body: some View {
        
        VStack{
            TextField("Exec Name",
                      text: $execName)
            .textFieldStyle(.roundedBorder)
            .autocapitalization(.none)
            .font(.custom(
                    "FontNameRound",
                    fixedSize: 20))
            .frame(width: 300, height: 50, alignment: .center)
            .border(.black)
            
            TextField("Exec UTorID",
                      text: $execUTorID)
            .textFieldStyle(.roundedBorder)
            .autocapitalization(.none)
            .font(.custom(
                    "FontNameRound",
                    fixedSize: 20))
            .frame(width: 300, height: 50, alignment: .center)
            .border(.black)
            
            TextField("Exec Password",
                      text: $execPassword)
            .textFieldStyle(.roundedBorder)
            .autocapitalization(.none)
            .font(.custom(
                    "FontNameRound",
                    fixedSize: 20))
            .frame(width: 300, height: 50, alignment: .center)
            .border(.black)
            
            TextField("Exec Position",
                      text: $execPosition)
            .textFieldStyle(.roundedBorder)
            .autocapitalization(.none)
            .font(.custom(
                    "FontNameRound",
                    fixedSize: 20))
            .frame(width: 300, height: 50, alignment: .center)
            .border(.black)
            
            TextField("Exec Email",
                      text: $execEmail)
            .textFieldStyle(.roundedBorder)
            .autocapitalization(.none)
            .font(.custom(
                    "FontNameRound",
                    fixedSize: 20))
            .frame(width: 300, height: 50, alignment: .center)
            .border(.black)
            
            
            
            VStack {
                Button {
                    if execName == "" {
                        showingAlert = true
                    }
                    else if execUTorID == "" {
                        showingAlert = true
                    }
                    else if execPassword == "" {
                        showingAlert = true
                    }
                    else if execPosition == "" {
                        showingAlert = true
                    }
                    else if execEmail == "" {
                        showingAlert = true
                    }
                    else {
                        let exec = Executive(id: execUTorID, name: execName, position: execPosition, email: execEmail)
                        let w = WriteExec(exec: exec)
                        
                        w.write()
                        w.writeLogin(password: execPassword)
                        
                        execCreated = true
                    }
                } label: {
                    Text("Create Exec")
                        .font(.custom("SF Pro", size: 22))
                    
                }
                .alert("Please complete all fields", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) {
                        showingAlert = false
                    }
                }
                .alert("Exec account created successfully", isPresented: $execCreated) {
                    Button("OK", role: .cancel) {
                        execCreated = false
                    }
                }
                .frame(width: 280, height: 50, alignment: .center)
                .buttonStyle(RoundedRectangleButtonStyle())
                
            }
        }
    }
}

struct ExecCreationView_Previews: PreviewProvider {
    static var previews: some View {
        ExecCreationView()
    }
}
