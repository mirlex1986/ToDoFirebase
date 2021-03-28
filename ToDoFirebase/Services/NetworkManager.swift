//
//  NetworkManager.swift
//  ToDoFirebase
//
//  Created by Алексей on 23.03.2021.
//

import Foundation
import Firebase

class NetworkManager {
    static let shared = NetworkManager()
    
    func logIn(email: String, password: String, completion: @escaping (Any?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let _ = error {
                completion(nil)
                return
            }
            
            if result != nil {
                completion(result)
            }
        }
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func createUser (email: String, password: String, completion: @escaping (Any?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let _ = error {
                completion(nil)
                return
            }
            
            if result != nil {
                completion(result)
            }
        }
    }
    
    private init() { }
}
