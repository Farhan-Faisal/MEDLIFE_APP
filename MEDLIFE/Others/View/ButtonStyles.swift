//
//  SwiftUIView.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-03-10.
//

import SwiftUI

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
      .cornerRadius(20)
      .padding(15)
    }
}


struct JoiningStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    HStack {
      Spacer()
      configuration.label.foregroundColor(.white)
      Spacer()
    }
    .font(.system(size: 16))
    .fontWeight(.medium)
    .foregroundColor(.white)
    .frame(width: 80, height: 25, alignment: .center)
    .background(.black)
    .padding(5)
  }
}


struct ModifyButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    HStack {
      Spacer()
      configuration.label.foregroundColor(.white)
      Spacer()
    }
    .font(.system(size: 16))
    .fontWeight(.medium)
    .foregroundColor(.white)
    .frame(width: 150, height: 25, alignment: .center)
    .background(.black)
    .padding(5)
  }
}
