//
//  BaseViewController.swift
//  CustomKeyboard
//
//  Created by KYOHEI KATO on 1/30/15.
//  Copyright (c) 2015 KYOHEI KATO. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIInputViewController {
    
    var baseViewControllerDelegate:BaseViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}

protocol BaseViewControllerDelegate {
    func moveNextKeyboard()
    
    func changeKeyView(sender: UIButton)
    
    func inputCharacter(senderText: String)
}