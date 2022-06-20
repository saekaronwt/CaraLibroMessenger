//
//  RegisterViewController.swift
//  CaraLibroMessenger
//
//  Created by Paul Torres on 18/05/22.
//

import UIKit

class RegisterViewController: UIViewController{
    @IBOutlet weak var InputName: UIView!
    @IBOutlet weak var InputLastName: UIView!
    @IBOutlet weak var InputEmail: UIView!
    @IBOutlet weak var InputPassword: UIView!
    @IBOutlet weak var ViewContainer: UIView!
    @IBOutlet weak var ContentY: NSLayoutConstraint!
    
    @IBAction func tapToCloseKeyboard(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
            print("RegisterViewController - viewDidLoad")
        InputName.layer.cornerRadius = 15
        InputLastName.layer.cornerRadius = 15
        InputEmail.layer.cornerRadius = 15
        InputPassword.layer.cornerRadius = 15
        ViewContainer.layer.cornerRadius = 100
        ViewContainer.clipsToBounds = true
        ViewContainer.layer.maskedCorners = [.layerMaxXMinYCorner]
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

extension RegisterViewController {
    
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
        
       if keyboardFrame.origin.y < self.ViewContainer.frame.maxY {
            
            UIView.animate(withDuration: animationDuration) {
               self.ContentY.constant = keyboardFrame.origin.y - self.ViewContainer.frame.maxY + 200
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

