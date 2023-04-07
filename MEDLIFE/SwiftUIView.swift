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
