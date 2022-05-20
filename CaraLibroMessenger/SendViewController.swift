//
//  SendViewController.swift
//  CaraLibroMessenger
//
//  Created by Paul Torres on 18/05/22.
//

import UIKit

class SendViewController: UIViewController {
    @IBOutlet weak var ViewContainerRadiusBottom: UIView!
    @IBOutlet weak var InputRadius: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewContainerRadiusBottom.layer.cornerRadius = 45
        ViewContainerRadiusBottom.clipsToBounds = true
        ViewContainerRadiusBottom.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        ViewContainerRadiusBottom.layer.shadowRadius = 10
        InputRadius.layer.cornerRadius = 10
    }
}
