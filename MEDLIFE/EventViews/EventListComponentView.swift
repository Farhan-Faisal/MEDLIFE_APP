//
//  tListComponentView.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-01-15.
//

import SwiftUI

struct EventListComponentView: View {
    @State var event: EventModel
    @State var ExecID: String
    
    var body: some View {
        
        HStack{
            
            Spacer()
            
            VStack(alignment: .leading){
                Text(event.name)
                    .foregroundColor(.black)
                    .font(.system(size: 22))
                
                Spacer()
                
                Text("Date: \(event.eventDate.formatted(date: .long, time: .omitted))")
                    .foregroundColor(.black)
                    .font(.system(size: 17))
                
                Spacer()
                
                Text("Audience: \(event.attendance)")
                    .foregroundColor(.black)
                    .font(.system(size: 17))
            }
            .frame(width: 165, height: 70, alignment: .leading)
            .padding()
            
            Spacer()
            
            VStack(alignment: .leading){
                Text("\(event.location)")
                    .foregroundColor(.black)
                    .font(.system(size: 20))
            }
            
            Spacer()
//            VStack(alignment: .leading) {
//                Button {
//                    let temp = WriteEvent(event: event)
//                    temp.updateAttendance(ExecID: ExecID)
//                } label: {
//                    Text("Going")
//                        .font(.system(size: 16))
//                }
//            }
//            .buttonStyle(RoundedRectangleButtonStyle())
        }
        .frame(width: 350, height: 75, alignment: .leading)
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 4))
    }
}

struct EventListComponentView_Previews: PreviewProvider {
    static var previews: some View {
        let m = EventModel(id: "event123", name: "Bake Sale", eventDate: Date(), attendance: 30, location: "AC 227", description: "test ecent this is")
        EventListComponentView(event: m, ExecID: "faisalf4")
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
