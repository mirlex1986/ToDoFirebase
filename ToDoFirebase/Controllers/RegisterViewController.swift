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
    
    let networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
    }
    
    
    @IBAction func registerButtonPressed() {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        
        if email != "", password != "" {
            networkManager.createUser(email: email, password: password) { [weak self] (result)  in
                if result != nil {
                    self?.performSegue(withIdentifier: "tasks", sender: nil)
                } else {
                    self?.showAlert(header: "Wrong e-mail or password", message: "Please, enter correct e-mail and password")
                    return
                }
            }
        }
    }
    
    @IBAction func cancelButtonPressed() {
        dismiss(animated: true)
    }
}


extension RegisterViewController: UITextFieldDelegate {
    
    private func configureTextFields() {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

//MARK: - Alert
extension RegisterViewController {
    private func showAlert (header: String, message: String) {
        let alert = UIAlertController(title: header, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .destructive)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
