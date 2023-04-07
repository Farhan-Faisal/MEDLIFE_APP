//
//  MemberLogin.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-01-02.
//

import SwiftUI

struct MemberLogin: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        
        VStack{
            Text("MEMBER LOGIN")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .padding()
            
            TextField("Email",
                      text: $email)
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)
                .frame(width: 300, height: 50, alignment: .center)
                .border(.black)
            
            TextField("Password",
                      text: $password)
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)
                .frame(width: 300, height: 50, alignment: .center)
                .border(.black)
            
            Button("Login", action: {})
                .fontWeight(.medium)
                .foregroundColor(.white)
                .frame(width: 300, height: 50, alignment: .center)
                .background(.black)
                .padding(15)
            
            Button("Create User", action: {})
                .fontWeight(.medium)
                .foregroundColor(.white)
                .frame(width: 300, height: 50, alignment: .center)
                .background(.black)
                .padding(15)
            
        }
        .padding()
    }
}

struct MemberLogin_Previews: PreviewProvider {
    static var previews: some View {
        MemberLogin()
    }
}
