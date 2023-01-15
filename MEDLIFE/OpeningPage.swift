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
    
    var body: some View {
       
        NavigationStack {

            VStack{
                Image("MedlifeLogo")
                    .resizable()
                    .scaledToFit()
            }
            .frame(width: 350, height: 300, alignment: .top)
            
            Text("MEDLIFE UTSC")
                .font(.system(size: 30))
                .fontWeight(.bold)
                
            
            VStack {
                Button {
                    goesToDetail = true
                } label: {
                    Text("EXEC LOGIN")
                }
            }
            .navigationDestination(isPresented: $goesToDetail) {
                ExecLogin()
            }
            .buttonStyle(RoundedRectangleButtonStyle())
                
            
            VStack {
                Button {
                    goesToDetail = true
                } label: {
                    Text("MEMBER LOGIN")
                }
            }
            .navigationDestination(isPresented: $goesToDetail) {
                ExecLogin()
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

struct RoundedRectangleButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    HStack {
      Spacer()
      configuration.label.foregroundColor(.white)
      Spacer()
    }
    .font(.system(size: 25))
    .fontWeight(.medium)
    .foregroundColor(.white)
    .frame(width: 300, height: 40, alignment: .center)
    .background(.black)
    .padding(15)
  }
}
