//
//  SubmitViewController.swift
//  CaraLibroMessenger
//
//  Created by Paul Torres on 18/05/22.
//

import UIKit

class SubmitViewController: UIViewController {
    @IBOutlet weak var ViewHeader: UIView!
    @IBOutlet weak var InputNewPass: UIView!
    @IBOutlet weak var InputConfirmPass: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewHeader.layer.cornerRadius = 45
        ViewHeader.clipsToBounds = true
        ViewHeader.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        InputNewPass.layer.cornerRadius = 15
        InputConfirmPass.layer.cornerRadius = 15
    }
}
