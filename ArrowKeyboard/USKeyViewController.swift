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
    
    @IBOutlet var numberKeyButtons: [UIButton]!
    @IBOutlet var alphabetKeyButtons: [UIButton]!
    @IBOutlet weak var shiftKeyButton: UIButton!
    @IBOutlet weak var moveMarkKeyButton: UIButton!
    @IBOutlet weak var nextKeyboardButton: UIButton!
    @IBOutlet var directionKeyButtons: [UIButton]!
    @IBOutlet weak var enterKeyButton: UIButton!
    
    var upperFlag:Bool!
    
    override func viewDidLoad() {
        initField()
    }
    
    func initField() {
        moveMarkKeyButton.tag = 2;
        upperFlag = false
    }
    
    func pushedShiftButton() {
        upperFlag = !upperFlag
    }
    
    @IBAction func changeKeyView(sender: UIButton) {
        super.baseViewController.changeKeyView(sender.tag)
    }
}
