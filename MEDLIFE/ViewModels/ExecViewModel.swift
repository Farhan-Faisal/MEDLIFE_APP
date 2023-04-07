import Foundation
import FirebaseDatabase

final class WriteExec: ObservableObject {
    
    var exec: Executive
    var ref = Database.database().reference()
    
    init(exec: Executive) {
        self.exec = exec
    }
    
    func write(){
        let child = ref.child("Executive").child(exec.id)
        
        do {
            let data = try JSONEncoder().encode(self.exec)
            let json = try JSONSerialization.jsonObject(with: data)
            child.setValue(json)
        } catch {
          print("an error occurred", error)
        }
    }
    
    func writeLogin(password: String){
        let child = ref.child("Login").child(exec.id)
        let login = LoginCredentials(id: self.exec.id, UTorID: self.exec.id, password: password)
        
        do {
            let data = try JSONEncoder().encode(login)
            let json = try JSONSerialization.jsonObject(with: data)
            child.setValue(json)
        } catch {
          print("an error occurred", error)
        }
    }
    
}
