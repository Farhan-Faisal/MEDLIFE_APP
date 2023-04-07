import Foundation
import FirebaseDatabase


final class WriteEvent: ObservableObject {
    
    var event: EventModel
    var ref = Database.database().reference()
    
    init(event: EventModel) {
        self.event = event
    }
    
    func write(){
        let child = ref.child("Events").child(event.id)
        
        do {
            let data = try JSONEncoder().encode(self.event)
            let json = try JSONSerialization.jsonObject(with: data)
            child.setValue(json)
        } catch {
          print("an error occurred", error)
        }
    }
    
    func updateAttendance(ExecID: String){
        let attendanceChild = ref.child("Attendance").child(event.id).child(ExecID)
        let eventChild =  ref.child("Events").child(self.event.id)
        let temp = ReadFromDatabase()

        attendanceChild.setValue(ExecID)

        temp.getAllChildKeys(childKey: "Attendance/\(self.event.id)"){complete in
            let newAttendance = temp.fetchedKeys.count
            self.event.attendance = newAttendance

            do {
                let newEventData = try JSONEncoder().encode(self.event)
                let eventJson = try JSONSerialization.jsonObject(with: newEventData)
                eventChild.setValue(eventJson)
            }
            catch{
                print("an error occurred", error)
            }

        }

        
    }
}
