//
//  OpeningPage.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2022-12-30.
//

import SwiftUI
//import ActionButton

struct OpeningPage: View {
    @ObservedObject var readViewModel = ReadFromDatabase()
    
    @State private var goesToDetail: Bool = false
    @State private var memberLogin: Bool = false
    
    var body: some View {
       
        NavigationStack {
            VStack{
                Image("MedlifeLogo")
                    .resizable()
                    .scaledToFit()
            }
            .frame(width: 350, height: 300, alignment: .top)
            
            Text("MEDLIFE UTSC")
                .font(.custom("SF Pro", size: 24))
                
            
            Button {
                goesToDetail = true
            } label: {
                Text("EXEC LOGIN")
                    .font(.custom("SF Pro", size: 18))
            }
            .navigationDestination(isPresented: $goesToDetail) {
                ExecLogin()
            }
            .buttonStyle(RoundedRectangleButtonStyle())
                
            
            Button {
                memberLogin = true
            } label: {
                Text("MEMBER LOGIN")
                    .font(.custom("SF Pro", size: 18))
            }
            .alert("Feature Coming Soon!", isPresented: $memberLogin) {
                Button("Okay", role: .cancel) {
                    memberLogin = false
                }
            }
            .buttonStyle(RoundedRectangleButtonStyle())
            
            
        }

    }
}

struct OpeningPage_Previews: PreviewProvider {
    static var previews: some View {
        OpeningPage()
    }
}
