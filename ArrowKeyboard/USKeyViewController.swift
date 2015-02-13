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

//    var USKeyBoardView: UIView!
    var forcusingButton: UIButton!
    var upperStatus:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        initField()
        var USKeyBoardView =  UINib(nibName: "USKeyView", bundle: nil).instantiateWithOwner(self, options: nil)[0] as UIView
        self.view.addSubview(USKeyBoardView)
    }
    
    func initField() {
        //index指定でいいのか

        for hoge:UIButton in numberKeyButtons {
            if hoge.tag == 1{
                forcusingButton = hoge
            }
        }
    }
    
    func changeAlphabetText() {
        if upperStatus {
            for button:UIButton in alphabetKeyButtons {
                button.setTitle(button.titleLabel?.text?.uppercaseString, forState: .Normal)
            }
        }else {
            for button:UIButton in alphabetKeyButtons {
                button.setTitle(button.titleLabel?.text?.lowercaseString, forState: .Normal)
            }
        }
    }
    
    @IBAction func decideKey(sender: UIButton) {
        super.baseViewControllerDelegate.inputCharacter(sender.currentTitle!)
    }
    
    //        upperStatus = !upperStatus
    //        changeAlphabetText()
    

    @IBAction func hoge(sender: UIButton) {
        println("pushed")
    }
    
    
    @IBAction func moveNextKeyboard(sender: UIButton) {
        super.baseViewControllerDelegate.moveNextKeyboard()
    }
    
    @IBAction func changeKeyView(sender: UIButton) {
        super.baseViewControllerDelegate.changeKeyView(sender)
    }
    

    @IBAction func inputCharacter(sender: UIButton) {
        super.baseViewControllerDelegate.inputCharacter(sender.currentTitle!)
    }
}
