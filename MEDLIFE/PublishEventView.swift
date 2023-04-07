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
    @State private var eventLocation: String = ""
    @State private var eventDescription: String = ""
    
    @State private var showingAlert = false
    @State private var eventCreated = false
    
    var body: some View {
        
        VStack{
            TextField("Event Name",
                      text: $eventName)
            .textFieldStyle(.roundedBorder)
            .autocapitalization(.none)
            .font(.custom(
                    "FontNameRound",
                    fixedSize: 20))
            .frame(width: 300, height: 50, alignment: .center)
            .border(.black)
            
            TextField("Location",
                      text: $eventLocation)
            .textFieldStyle(.roundedBorder)
            .autocapitalization(.none)
            .font(.custom(
                    "FontNameRound",
                    fixedSize: 20))
            .frame(width: 300, height: 50, alignment: .center)
            .border(.black)
            
            
            DatePicker(selection: $eventDate, in: Date.now..., displayedComponents: .date) {
                Text("Event Date")
            }
            .frame(width: 280, height: 50, alignment: .center)
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 2, trailing: 10))
            .border(.black)
            
            TextField("Event Description", text: $eventDescription,
                      axis: .vertical)
            .frame(width: 280, height: 200, alignment: .center)
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 2, trailing: 10))
            .border(.black)
            
            VStack {
                Button {
                    if eventName == "" {
                        showingAlert = true
                    }
                    else {
                        let event = EventModel(id: eventName, name: eventName, eventDate: eventDate, attendance: 0, location: eventLocation, description: eventDescription)
                        let w = WriteEvent(event: event)
                        w.write()
                
                        eventCreated = true
                    }
                } label: {
                    Text("Create Event")
                }
                .alert("Please complete all fields", isPresented: $showingAlert){
                    Button("OK", role: .cancel) {
                        showingAlert = false
                    }
                }
                .alert("Event created successfully", isPresented: $eventCreated){
                    Button("OK", role: .cancel) {
                        eventCreated = false
                    }
                }
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
