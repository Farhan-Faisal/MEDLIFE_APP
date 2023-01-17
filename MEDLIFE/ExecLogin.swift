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
    
    var body: some View {
        
        VStack{
            Text("EXEC LOGIN")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .padding()
            
            TextField("UTorID",
                      text: $UTorID)
                .autocapitalization(.none)
                .textFieldStyle(.roundedBorder)
                .frame(width: 300, height: 50, alignment: .center)
                .border(.black)
            
            TextField("Password",
                      text: $password)
                .autocapitalization(.none)
                .textFieldStyle(.roundedBorder)
                .frame(width: 300, height: 50, alignment: .center)
                .border(.black)
            
            VStack {
                Button {
                    for item in readViewModel.login{
                        if item.password == self.password {
                            if item.UTorID == self.UTorID {
                                goesToDetail = true
                            }
                        }
                    }
                } label: {
                    Text("LOGIN")
                }
                .onTapGesture {
                }
            }
            .navigationDestination(isPresented: $goesToDetail) {
                ExecHomeView()
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
