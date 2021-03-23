//
//  RegisterViewController.swift
//  ToDoFirebase
//
//  Created by Алексей on 23.03.2021.
//

import UIKit
import TextFieldEffects
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        
    }
    
    
    @IBAction func registerButtonPressed() {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        
        if email != "", password != "" {
            Auth.auth().createUser(withEmail: email, password: password) { [weak self] (result, error) in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                if result != nil {
                    self?.performSegue(withIdentifier: "tasks", sender: nil)
                }
            }
        }
    }
    
    @IBAction func cancelButtonPressed() {
        dismiss(animated: true)
    }
}


extension RegisterViewController {
    private func configureTextFields() {

    }
    
    
    
    
}
