//
//  LoginViewController.swift
//  CaraLibroMessenger
//
//  Created by Paul Torres on 18/05/22.
//

import UIKit
import Firebase
import FirebaseAuth
class LoginViewController : UIViewController{
    
    
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    
    @IBAction func btnLogin(_ sender: Any) {
        
        if let email = txtFieldEmail.text, let password = txtFieldPassword.text{
            Auth.auth().signIn(withEmail: email, password: password){
                (result, error) in
                
                if let result = result, error == nil{
                    //self.navigationController?.pushViewController(MenuViewController(email:result.user.email!, provider: .basic), animated: true)
                    self.showAlertWithTitle("Bienvenido", message: "Los datos son correctos", accept: "Aceptar")
                }else{
                    self.showAlertWithTitle("Error Login", message: "Los datos son incorrectos", accept: "Aceptar")
                }
            }
        }
    }
    
    @IBOutlet weak var ViewInputRadiusPassword: UIView!
    @IBOutlet weak var ViewInputRadiusEmail: UIView!
    @IBOutlet weak var ViewContainerRadiusTopLeft: UIView!
    @IBOutlet weak var ContentY: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("LoginViewController - viewDidLoad")
        ViewContainerRadiusTopLeft.layer.cornerRadius = 100;
        ViewContainerRadiusTopLeft.clipsToBounds = true;
        ViewContainerRadiusTopLeft.layer.maskedCorners = [.layerMinXMinYCorner]
        ViewInputRadiusEmail.layer.cornerRadius = 15
        ViewInputRadiusPassword.layer.cornerRadius = 15
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.unregisterKeyboardNotifications()
    }
}

extension LoginViewController {
    
    private func registerKeyboardNotifications() {
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    private func unregisterKeyboardNotifications() {
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        
        if keyboardFrame.origin.y < self.ViewContainerRadiusTopLeft.frame.maxY {
            
            UIView.animate(withDuration: animationDuration) {
                self.ContentY.constant = keyboardFrame.origin.y - self.ViewContainerRadiusTopLeft.frame.maxY + 200
                print("CONTENTY" , self.ContentY.constant)
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        UIView.animate(withDuration: animationDuration) {
            self.ContentY.constant = 30
            self.view.layoutIfNeeded()
        }
    }
}
