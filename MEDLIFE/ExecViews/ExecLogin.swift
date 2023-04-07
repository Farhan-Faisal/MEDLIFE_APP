//
//  SwiftUIView.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-01-02.
//

import SwiftUI

struct ExecLogin: View {
    
    @ObservedObject var readViewModel = ReadFromDatabase()
    @State private var UTorID: String = ""
    @State private var password: String = ""
    
    @State private var goesToDetail: Bool = false
    @State private var inCorrectLogin: Bool = false
    
    var body: some View {
        
        VStack{
            Text("EXEC LOGIN")
                .font(.custom("SF Pro", size: 24))
                .fontWeight(.bold)
                .padding()
            
            TextField("UTorID",
                      text: $UTorID)
                .autocapitalization(.none)
                .textFieldStyle(.roundedBorder)
                .frame(width: 300, height: 40, alignment: .center)
                .border(.black)
            
            SecureField("Password",
                      text: $password)
                .autocapitalization(.none)
                .textFieldStyle(.roundedBorder)
                .frame(width: 300, height: 40, alignment: .center)
                .border(.black)
            
            VStack {
                Button {
                    for item in readViewModel.login{
                        if item.UTorID == self.UTorID {
                            if item.password == self.password {
                                goesToDetail = true
                            }
                        }
                    }
                    
                    if goesToDetail == false {
                        inCorrectLogin = true
                    }
                } label: {
                    Text("LOGIN")
                        .font(.custom("SF Pro", size: 18))
                }
                .alert("Incorrect Login Credentials", isPresented: $inCorrectLogin) {
                    Button("Try again", role: .cancel) {
                        inCorrectLogin = false
                    }
                }
            }
            .navigationDestination(isPresented: $goesToDetail) {
                ExecHomeView(UTorID: UTorID)
            }
            .buttonStyle(RoundedRectangleButtonStyle())
            
        }
        .onAppear(){
            self.readViewModel.getAllChildKeys(childKey: "Login"){complete in
                let keys = self.readViewModel.fetchedKeys
                self.readViewModel.generateLoginList(keys: keys){fin in
                }
            }
        }
        
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ExecLogin()
    }
}
