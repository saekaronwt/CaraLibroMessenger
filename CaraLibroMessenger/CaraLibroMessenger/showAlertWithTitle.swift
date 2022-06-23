//
//  showAlertWithTitle.swift
//  CaraLibroMessenger
//
//  Created by Luis on 22/06/22.
//

import UIKit

extension UIViewController {
    
    func showAlertWithTitle(_ title: String, message: String, accept: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let closeAction = UIAlertAction(title: accept, style: .cancel, handler: nil)
        alertController.addAction(closeAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
