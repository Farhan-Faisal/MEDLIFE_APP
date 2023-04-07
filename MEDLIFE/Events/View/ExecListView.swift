//
//  ExecHomeView.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-01-08.
//

import SwiftUI

struct ExecEventView: View {
    
    @ObservedObject var readViewModel = ReadFromDatabase()
    @State var ExecID: String
    @State var goesToDetail = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(readViewModel.eventList, id: \.self){event in
                    EventListComponentView(event: event, ExecID: ExecID)
                }
                .onDelete { offsets in
                    for index in offsets{
                        let tempRef = readViewModel.ref.child("Events").child(readViewModel.eventList[index].id)
                        tempRef.removeValue()
                    }
                    readViewModel.eventList.remove(atOffsets: offsets)
                }
            }
            .frame(width: 390, alignment: .leading)
            .background(Color.white)
            .onAppear(){
                self.readViewModel.getAllChildKeys(childKey: "Events"){complete in
                    let keys = self.readViewModel.fetchedKeys
                    self.readViewModel.generateEventList(keys: keys){ done in
                    }
                }
            }
            .navigationBarTitle("Events")

            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        goesToDetail = true
                    }, label: {
                        Image(systemName: "plus.square")
                            .imageScale(.large)
                    })
                    .navigationDestination(isPresented: $goesToDetail) {
                        PublishEventView()
                    }
                }
            }
            
        }
    }
}

//struct ExecEventView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExecEventView()
//    }
//}
