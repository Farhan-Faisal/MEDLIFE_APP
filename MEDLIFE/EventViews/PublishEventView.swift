//
//  PublishEventView.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-01-17.
//

import SwiftUI

struct PublishEventView: View {
    @State private var eventName: String = ""
    @State private var eventDate: Date = Date()
    
    @State private var showingAlert = false
    @State private var eventCreated = false
    
    var body: some View {
        
        VStack{
            TextField("Event Name",
                      text: $eventName)
            .textFieldStyle(.roundedBorder)
            .font(.custom(
                    "FontNameRound",
                    fixedSize: 20))
            .frame(width: 300, height: 50, alignment: .center)
            .border(.black)
            
            
            DatePicker(selection: $eventDate, in: ...Date.now, displayedComponents: .date) {
                Text("Event Date")
            }
            .frame(width: 280, height: 50, alignment: .center)
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 2, trailing: 10))
            .border(.black)
            
            VStack {
                Button {
                    if eventName == "" {
                        showingAlert = true
                    }
                    else {
                        let event = EventModel(id: eventName, name: eventName, eventDate: eventDate, attendance: 0)
                        let w = WriteEvent(event: event)
                        w.write()
                
                        eventCreated = true
                    }
                } label: {
                    Text("Create and Assign")
                }
                .alert("Please complete all fields", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) {
                        showingAlert = false
                    }
                }
                .alert("Event created successfully", isPresented: $eventCreated) {
                    Button("OK", role: .cancel) {
                        eventCreated = false
                    }
                }
                .frame(width: 280, height: 50, alignment: .center)
                .buttonStyle(RoundedRectangleButtonStyle())
                
            }
        }
    }
}

struct PublishEventView_Previews: PreviewProvider {
    static var previews: some View {
        PublishEventView()
    }
}
