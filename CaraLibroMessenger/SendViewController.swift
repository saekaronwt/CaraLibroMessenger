//
//  SendViewController.swift
//  CaraLibroMessenger
//
//  Created by Paul Torres on 18/05/22.
//

import UIKit
import FirebaseAuth

class SendViewController: UIViewController {
    @IBOutlet weak var ViewContainerRadiusBottom: UIView!
    @IBOutlet weak var InputRadius: UIView!
    
    
    @IBOutlet weak var emailText: UITextField!
    @IBAction func btnChangePasswordWithEmail(_ sender: Any) {
        guard let email = emailText.text, !email.isEmpty else {
            return self.showAlertWithTitle("Error", message: "Los datos son incorrectos", accept: "OK")
        }
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if let error = error {
                self.showAlertWithTitle("Error", message: error.localizedDescription, accept: "OK")
            } else {
              
                if let url = URL(string: "https://mail.google.com/mail/u/0/#inbox") {
                UIApplication.shared.open(url)
                }
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewContainerRadiusBottom.layer.cornerRadius = 45
        ViewContainerRadiusBottom.clipsToBounds = true
        ViewContainerRadiusBottom.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        ViewContainerRadiusBottom.layer.shadowRadius = 10
        InputRadius.layer.cornerRadius = 10
    }
}
