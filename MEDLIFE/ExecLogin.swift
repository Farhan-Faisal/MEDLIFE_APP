//
//  SwiftUIView.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-01-02.
//

import SwiftUI

struct ExecLogin: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        
        VStack{
            Text("EXEC LOGIN")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .padding()
            
            TextField("Email",
                      text: $email)
                .textFieldStyle(.roundedBorder)
                .frame(width: 300, height: 50, alignment: .center)
                .border(.black)
            
            TextField("Password",
                      text: $password)
                .textFieldStyle(.roundedBorder)
                .frame(width: 300, height: 50, alignment: .center)
                .border(.black)
            
            Button("Login", action: {})
                .fontWeight(.medium)
                .foregroundColor(.white)
                .frame(width: 300, height: 50, alignment: .center)
                .background(.black)
                .padding(15)
        }
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ExecLogin()
    }
}
