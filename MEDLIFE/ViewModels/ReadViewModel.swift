//
//  ExecModelDB.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-01-07.
//

import Foundation
import FirebaseDatabase

final class ReadFromDatabase: ObservableObject, Identifiable {
    
    @Published
    var ref = Database.database().reference()
    
    @Published
    var value: String? = nil
    
    @Published
    var exec: Executive? = nil
    
    @Published
    var singleLogin: LoginCredentials? = nil
    
    @Published
    var login: [LoginCredentials] = [LoginCredentials]()
        
    @Published
    var taskList: [TaskModel] = [TaskModel]()
    
    @Published
    var execList: [Executive] = [Executive]()
    
    @Published
    var eventList: [EventModel] = [EventModel]()
    
    @Published
    var fetchedKeys: [String] = [String]()

    
    func readValue(childKey: String, completion: @escaping (Bool) -> ()){
        let child = ref.child(childKey)
        child.observeSingleEvent(of: .value){snapshot in
            self.value = snapshot.value as? String
        }
        
        var flag = false
        if (self.value != nil){
            flag = true
        }
        completion(flag)
    }
    
    func fetchSingleLoginCred(childKey: String, completion: @escaping (Bool) -> ()){
        let child = ref.child("Login").child(childKey)
        
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
                let loginData = try JSONSerialization.data(withJSONObject: json)
                self.singleLogin = try JSONDecoder().decode(LoginCredentials.self, from: loginData)
            } catch {
                print("an error occurred", error)
            }
            
            var flag = false
            if (self.singleLogin != nil){
                flag = true
            }
            completion(flag)
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
        self.fetchedKeys.removeAll()
        
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
        
        self.taskList = [TaskModel]()
        
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
                    let temp = try JSONDecoder().decode(TaskModel.self, from: taskData)
                    
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
    
    
    func generateLoginList(keys: [String], completion: @escaping (Bool) -> ()){
        
        for item in keys{
            let child = ref.child("Login/\(item)")
            child.observeSingleEvent(of: .value){[weak self] snapshot in
                
                guard
                    let self = self,
                    var json = snapshot.value as? [String: Any]
                else {
                    return
                }
                
                json["id"] = snapshot.key
                do {
                    let loginData = try JSONSerialization.data(withJSONObject: json)
                    let temp = try JSONDecoder().decode(LoginCredentials.self, from: loginData)

                    if self.login.contains(temp) == false{
                        self.login.append(temp)
                    }
                } catch {
                    print("an error occurred", error)
                }
            }
        }
        
        var flag = false
        if (self.login.count == self.fetchedKeys.count){
            flag = true
        }
        completion(flag)
    }
    
    
    func generateEventList(keys: [String], completion: @escaping (Bool) -> ()){
        
        for item in keys{
            let child = ref.child("Events").child(item)
            child.observeSingleEvent(of: .value){[weak self] snapshot in
                
                guard
                    let self = self,
                    var json = snapshot.value as? [String: Any]
                else {
                    return
                }
                
                json["id"] = snapshot.key
                do {
                    let eventData = try JSONSerialization.data(withJSONObject: json)
                    let temp = try JSONDecoder().decode(EventModel.self, from: eventData)
                    
                    if self.eventList.contains(temp) == false{
                        self.eventList.append(temp)
                    }
                } catch {
                    print("an error occurred", error)
                }
            }
        }
        
        var flag = false
        if (self.eventList.count == self.fetchedKeys.count){
            flag = true
        }
        completion(flag)
    }
}
