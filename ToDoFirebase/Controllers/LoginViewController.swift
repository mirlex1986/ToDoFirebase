//
//  LoginViewController.swift
//  ToDoFirebase
//
//  Created by Алексей on 22.03.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextFiels: UITextField!
    @IBOutlet weak var passwordTextFiels: UITextField!
    
    let networkManager = NetworkManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emailTextFiels.text = ""
        passwordTextFiels.text = ""
    }

    @IBAction func loginButtonPressed() {
        guard let email = emailTextFiels.text, let password = passwordTextFiels.text else { return }
        
        guard email != "", password != "" else {
            showAlert(header: "Error", message: "e-mail or password is missed")
            return
        }
        
        networkManager.logIn(email: email, password: password) { [weak self] (result) in
            if result != nil {
                self?.performSegue(withIdentifier: "tasks", sender: nil)
            } else {
                self?.showAlert(header: "Wrong e-mail or password", message: "Please, enter correct e-mail and password")
                return
            }
        }
    }
    
    
}
//MARK: - Alert
extension LoginViewController {
    private func showAlert (header: String, message: String) {
        let alert = UIAlertController(title: header, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .destructive)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    
}
