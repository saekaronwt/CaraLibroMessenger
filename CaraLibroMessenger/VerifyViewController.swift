//
//  VerifyViewController.swift
//  CaraLibroMessenger
//
//  Created by Paul Torres on 18/05/22.
//

import UIKit

class VerifyViewController: UIViewController {
    @IBOutlet weak var ViewHeader: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewHeader.layer.cornerRadius = 45
        ViewHeader.clipsToBounds = true
        ViewHeader.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
    }
}
