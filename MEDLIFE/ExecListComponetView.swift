//
//  ExecListComponetView.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-01-13.
//

import SwiftUI

struct ExecListComponetView: View {
    @State var exec: Executive
    
    var body: some View {
        
            VStack(alignment: .leading){
                Text(exec.name)
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                
                Text("- \(exec.position)")
                    .foregroundColor(.black)
                    .font(.system(size: 15))
            }
            .frame(width: 300, height: 40, alignment: .leading)
    }
}
