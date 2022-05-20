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
            print("RegisterViewController - viewWillAppear")
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            print("RegisterViewController - viewDidAppear")
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            print("RegisterViewController - viewWillDisappear")
        }
        
        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            print("RegisterViewController - viewDidDisappear")
        }
}
