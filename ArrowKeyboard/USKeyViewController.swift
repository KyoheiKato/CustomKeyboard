//
//  USKeyView.swift
//  CustomKeyboard
//
//  Created by KYOHEI KATO on 1/27/15.
//  Copyright (c) 2015 KYOHEI KATO. All rights reserved.
//

import Foundation
import UIKit

class USKeyViewController: BaseViewController {
    
    @IBOutlet weak var moveMarkKey: UIButton!
    
    var upperFlag:Bool!
    
    override func viewDidLoad() {
        initField()
    }
    
    func initField() {
        moveMarkKey.tag = 2;
        upperFlag = false
    }
    
    func pushedShiftButton() {
        upperFlag = !upperFlag
    }
    
    @IBAction func changeKeyView(sender: UIButton) {
        super.commonViewController.changeKeyView(sender.tag)
    }
}
