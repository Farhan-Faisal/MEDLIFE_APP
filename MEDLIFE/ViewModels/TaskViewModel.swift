import Foundation
import FirebaseDatabase

final class WriteTask: ObservableObject {
    var task: TaskModel
    var ref = Database.database().reference()
    
    init(task: TaskModel) {
        self.task = task
    }
    
    func write(){
        let child = ref.child("Tasks").child(task.execID).child(task.id)
        
        do {
            let data = try JSONEncoder().encode(self.task)
            let json = try JSONSerialization.jsonObject(with: data)
            child.setValue(json)
        } catch {
            print("an error occurred", error)
        }
    }
}
