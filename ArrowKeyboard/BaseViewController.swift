//
//  BaseViewController.swift
//  CustomKeyboard
//
//  Created by KYOHEI KATO on 1/30/15.
//  Copyright (c) 2015 KYOHEI KATO. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    var commonViewController:CommonViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

protocol CommonViewControllerDelegate {
    func moveNextKeyboard()
    
    func changeKeyView(senderTag: Int)
}