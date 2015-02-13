//
//  KeyboardViewController.swift
//  ArrowKeyboard
//
//  Created by KYOHEI KATO on 1/27/15.
//  Copyright (c) 2015 KYOHEI KATO. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController{
    
    //each key view
    var USKeyView:UIView!
    var JPKeyView:UIView!
    var markKeyView:UIView!
    var keyViewIndex = 0
    
    //US key outlet
    @IBOutlet var alphabetKeys: [UIButton]!
    @IBOutlet var USKeys: [UIButton]!
    
    //JP key outlet
    @IBOutlet var JPKeys: [UIButton]!
    
    //US key value
    var shiftStatus:Bool = false
    var tagettingUSKey:UIButton!
    
    //JP key value
    let JPArray:[[String]] = [["あ", "い", "う", "え", "お"],
                              ["か", "き", "く", "け", "こ"],
                              ["さ", "し", "す", "せ", "そ"],
                              ["た", "ち", "つ", "て", "と"],
                              ["な", "に", "ぬ", "ね", "の"],
                              ["は", "ひ", "ふ", "へ", "ほ"],
                              ["ま", "み", "む", "め", "も"],
                              ["や", "", "ゆ", "", "よ"],
                              ["ら", "り", "る", "れ", "ろ"],
                              ["わ", "", "を", "", "ん"]]
    var JPArrayIndex:Int = 0
    var targettingJPKey:UIButton!


    override func updateViewConstraints() {
        super.updateViewConstraints()

        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initField()
        appendKeyViews()
        setTargetKey()
        
        self.inputView.addSubview(USKeyView)
    }
    
    func initField() {
    }
    
    func appendKeyViews() {
        USKeyView = UINib(nibName: "USKeyView", bundle: nil).instantiateWithOwner(self, options: nil)[0] as UIView
        JPKeyView = UINib(nibName: "JPKeyView", bundle: nil).instantiateWithOwner(self, options: nil)[0] as UIView
        markKeyView = UINib(nibName: "MarkKeyView", bundle: nil).instantiateWithOwner(self, options: nil)[0] as UIView
    }
    
    func setTargetKey() {
        for button:UIButton in USKeys {
            
        }
        for button:UIButton in JPKeys {
            if button.tag == 1 {
                targettingJPKey = button
                targettingJPKey.backgroundColor = UIColor.grayColor()
            }
        }
    }
    
    //US key funcs
    func getNextKeyView() -> UIView {
        var index = ++keyViewIndex % 3
        switch index {
            case 0:
                return USKeyView
            case 1:
                return JPKeyView
            case 2:
                return markKeyView
            default:
                return UIView()
        }
    }
    
    func getCurrentKeyView() -> UIView {
        switch keyViewIndex {
            case 0:
                return USKeyView
            case 1:
                return JPKeyView
            case 2:
                return markKeyView
            default:
                return UIView()
        }
    }
    
    func redrawAlphabetKeys() {
        for button:UIButton in alphabetKeys {
            if shiftStatus {
                button.setTitle(button.currentTitle!.uppercaseString, forState: .Normal)
            }else {
                button.setTitle(button.currentTitle!.lowercaseString, forState: .Normal)
            }
        }
    }
    
    //JP key funcs
    func redrawJPKeys() {
        
    }
    
    //share key funcs
    func redrawTargetKey(targetKey:UIButton, targetKeys:[UIButton], tag:Int) -> UIButton{
        targettingJPKey.backgroundColor = UIColor.whiteColor()
        for button:UIButton in targetKeys {
            if button.tag == tag {
                return button
            }
        }
        return UIButton()
    }
    
    
    //US key actions
    @IBAction func inputCharacter(sender: UIButton) {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        proxy.insertText(sender.currentTitle!)
    }
    
    @IBAction func changeShiftStatus(sender: UIButton) {
        if shiftStatus {
            shiftStatus = false
        }else {
            shiftStatus = true
        }
        redrawAlphabetKeys()
    }
    
    //JP key actions
    @IBAction func upJPKeys(sender: UIButton) {
        if JPArrayIndex % 10 == 0 {
            JPArrayIndex += 9
        }else {
            JPArrayIndex--
        }
        var displayJPArray = JPArray[JPArrayIndex % 10]
        var i = 0
        for button:UIButton in JPKeys {
            button.setTitle(displayJPArray[i++], forState: .Normal)
        }
    }
    
    @IBAction func downJPKeys(sender: UIButton) {
        JPArrayIndex++
        var displayJPArray = JPArray[JPArrayIndex % 10]
        var i = 0
        for button:UIButton in JPKeys {
            button.setTitle(displayJPArray[i++], forState: .Normal)
        }
    }
    
    @IBAction func moveLeftKey(sender: UIButton) {
        
    }
    
    @IBAction func moveRightKey(sender: UIButton) {
    }
    
    //share key funcs
    @IBAction func inputBackSpace(sender: UIButton) {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        proxy.deleteBackward()
    }
    
    @IBAction func changeKeyView(sender: UIButton) {
        getCurrentKeyView().removeFromSuperview()
        self.inputView.addSubview(getNextKeyView())
    }
    
    @IBAction func nextKeyboard(sender: UIButton) {
        self.advanceToNextInputMode()
    }
}
