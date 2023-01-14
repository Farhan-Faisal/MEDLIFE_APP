//
//  ExecModelDB.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-01-07.
//

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
}


final class WriteTask: ObservableObject {
    var task: Task
    var ref = Database.database().reference()
    
    init(task: Task) {
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


final class ReadFromDatabase: ObservableObject, Identifiable {
    
    @Published
    var ref = Database.database().reference()
    
    @Published
    var value: String? = nil
    
    @Published
    var exec: Executive? = nil
    
    @Published
    var taskList: [Task] = [Task]()
    
    @Published
    var execList: [Executive] = [Executive]()
    
    @Published
    var fetchedKeys: [String] = [String]()

    
    func readValue(childKey: String){
        let child = ref.child(childKey)
        child.observeSingleEvent(of: .value){snapshot in
            self.value = snapshot.value as? String
        }
    }
    
    func generateExec(childKey: String, completion: @escaping (Bool) -> ()){
        let child = ref.child(childKey)
        
        child.observeSingleEvent(of: .value){[weak self] snapshot in
            completion(!snapshot.exists())
            
            guard
                let self = self,
                var json = snapshot.value as? [String: Any]
            else {
                return
            }
            
            json["id"] = snapshot.key
            do {
                let execData = try JSONSerialization.data(withJSONObject: json)
                self.exec = try JSONDecoder().decode(Executive.self, from: execData)
                
            } catch {
                print("an error occurred", error)
            }
            
            var flag = false
            if (self.exec != nil){
                flag = true
            }
            completion(flag)
        }
    }
    
    func getAllChildKeys(childKey: String, completion: @escaping (Bool) -> ()) {
        let child = ref.child(childKey)

        child.observeSingleEvent(of: .value){ snapshot  in
            
            completion(!snapshot.exists())
            
            for case let m as DataSnapshot in snapshot.children {
                self.fetchedKeys.append(m.key)
            }
            
            var flag = false
            if (self.fetchedKeys.count != 0){
                flag = true
            }
            completion(flag)
        }
    }
    
    func generateExecList(keys: [String], completion: @escaping (Bool) -> ()){
        for item in keys{
            
            let child = ref.child("Executive").child(item)
            child.observeSingleEvent(of: .value){[weak self] snapshot in
                
                guard
                    let self = self,
                    var json = snapshot.value as? [String: Any]
                else {
                    return
                }
                
                json["id"] = snapshot.key
                do {
                    let execData = try JSONSerialization.data(withJSONObject: json)
                    let temp = try JSONDecoder().decode(Executive.self, from: execData)
                    
                    if self.execList.contains(temp) == false{
                        self.execList.append(temp)
                    }
                } catch {
                    print("an error occurred", error)
                }
            }
        }
        
        var flag = false
        if (self.execList.count == self.fetchedKeys.count){
            flag = true
        }
        completion(flag)
    }
    
    func generateTaskList(execID: String, keys: [String], completion: @escaping (Bool) -> ()){
        for item in keys{
            
            let child = ref.child("Tasks").child(execID).child(item)
            child.observeSingleEvent(of: .value){[weak self] snapshot in
                
                guard
                    let self = self,
                    var json = snapshot.value as? [String: Any]
                else {
                    return
                }
                
                json["id"] = snapshot.key
                do {
                    let taskData = try JSONSerialization.data(withJSONObject: json)
                    let temp = try JSONDecoder().decode(Task.self, from: taskData)
                    
                    if self.taskList.contains(temp) == false{
                        self.taskList.append(temp)
                    }
                } catch {
                    print("an error occurred", error)
                }
            }
        }
        
        var flag = false
        if (self.taskList.count == self.fetchedKeys.count){
            flag = true
        }
        completion(flag)
    }
    
}
