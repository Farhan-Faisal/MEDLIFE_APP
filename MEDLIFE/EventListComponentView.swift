//
//  tListComponentView.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-01-15.
//

import SwiftUI

struct EventListComponentView: View {
    @State var event: EventModel
    
    var body: some View {
        
            VStack(alignment: .leading){
                Text(event.name)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                
                Text(event.eventDate.formatted(date: .long, time: .omitted))
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .font(.system(size: 15))
                
                Text("Attendance/\(event.attendance)")
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .font(.system(size: 15))
            }
            .padding(.vertical, 2)
    }
}

struct EventListComponentView_Previews: PreviewProvider {
    static var previews: some View {
        let m = EventModel(id: "event123", name: "Bake Sale", eventDate: Date(), attendance: 30)
        EventListComponentView(event: m)
    }
}
