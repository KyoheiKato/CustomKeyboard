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
    
    //Mark key outlet
    @IBOutlet var markKeys: [UIButton]!
    @IBOutlet weak var swapJP: UIButton!
    
    //US key value
    var shiftStatus:Bool = false
    var targettingUSKey:UIButton!
    var targettingUSTag = 1
    
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
    var targettingJPTag = 0
    
    //Mark key value
    let swapArray:[String] = ["全角", "半角"]
    let markHalfArray:[String] = ["+", "-", "*", "/", "%", "=", "&", "|",
                                  ",", ".", "!", "?", "'", "\"", ";", ":",
                                  "(", ")", "{", "}", "[", "]", "<", ">",
                                  "@", "#", "^", "$", "_", "\\", "`", "~"]
    let markEmArray:[String] = ["＋", "ー", "＊", "／", "％", "＝", "＆", "｜",
                                "、", "。", "！", "？", "’", "”", "；", "：",
                                "（", "）", "｛", "｝", "「", "」", "＜", "＞",
                                "＠", "＃", "＾", "＄", "＿", "￥", "｀", "〜"]
    var halfStatus = true
    var targettingMarkKey:UIButton!
    var targettingMarkTag = 1
    

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
            if button.tag == 1 {
                targettingUSKey = button
                targettingUSKey.backgroundColor = UIColor.grayColor()
            }
        }
        for button:UIButton in JPKeys {
            if button.tag == 1 {
                targettingJPKey = button
                targettingJPKey.backgroundColor = UIColor.grayColor()
            }
        }
        for button:UIButton in markKeys {
            if button.tag == 1 {
                targettingMarkKey = button
                targettingMarkKey.backgroundColor = UIColor.grayColor()
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
        var displayJPArray = JPArray[JPArrayIndex % 10]
        var i = 0
        for button:UIButton in JPKeys {
            button.setTitle(displayJPArray[i++], forState: .Normal)
        }
    }
    
    //Mark key funcs
    func redrawMarkKeys() {
        if halfStatus {
            for button:UIButton in markKeys {
                button.setTitle(markHalfArray[button.tag-1], forState: .Normal)
            }
        }else {
            for button:UIButton in markKeys {
                button.setTitle(markEmArray[button.tag-1], forState: .Normal)
            }
        }
    }
    
    //share key funcs
    func getNextTargetKey(targettingKey:UIButton, targettingKeys:[UIButton], tag:Int) -> UIButton{
        targettingKey.backgroundColor = UIColor.whiteColor()
        for button:UIButton in targettingKeys {
            if button.tag == tag {
                return button
            }
        }
        return UIButton()
    }
    
    //US key actions
    @IBAction func changeShiftStatus(sender: UIButton) {
        if shiftStatus {
            shiftStatus = false
        }else {
            shiftStatus = true
        }
        redrawAlphabetKeys()
    }
    
    @IBAction func moveUpUSKey(sender: UIButton) {
        if targettingUSTag%5 == 1 {
            if targettingUSTag == 1 || targettingUSTag == 41  {
                targettingUSTag += 2
            }else if targettingUSTag == 46 {
                targettingUSTag++
            }else {
                targettingUSTag += 3
            }
        }else {
            targettingUSTag--
        }
        targettingUSKey = getNextTargetKey(targettingUSKey, targettingKeys: USKeys, tag: targettingUSTag)
        targettingUSKey.backgroundColor = UIColor.grayColor()
    }
    
    @IBAction func moveDownUSKey(sender: UIButton) {
        if targettingUSTag%5 == 4{
            targettingUSTag -= 3
        }else if targettingUSTag == 3 || targettingUSTag == 43 {
            targettingUSTag -= 2
        }else if targettingUSTag == 47{
            targettingUSTag--
        }else {
            targettingUSTag++
        }
        targettingUSKey = getNextTargetKey(targettingUSKey, targettingKeys: USKeys, tag: targettingUSTag)
        targettingUSKey.backgroundColor = UIColor.grayColor()
    }
    
    @IBAction func moveLeftUSKey(sender: UIButton) {
        if targettingUSTag == 1 || targettingUSTag == 2 {
            targettingUSTag += 45
        }else if targettingUSTag == 3 {
            targettingUSTag += 40
        }else if targettingUSTag == 9 {
            targettingUSTag += 30
        }else {
            targettingUSTag -= 5
        }
        targettingUSKey = getNextTargetKey(targettingUSKey, targettingKeys: USKeys, tag: targettingUSTag)
        targettingUSKey.backgroundColor = UIColor.grayColor()
    }
    
    
    @IBAction func moveRightUSKey(sender: UIButton) {
        if targettingUSTag == 46 || targettingUSTag == 47{
            targettingUSTag -= 45
        }else if targettingUSTag == 43 {
            targettingUSTag -= 40
        }else if targettingUSTag == 39 {
            targettingUSTag -= 30
        }else{
            targettingUSTag += 5
        }
        targettingUSKey = getNextTargetKey(targettingUSKey, targettingKeys: USKeys, tag: targettingUSTag)
        targettingUSKey.backgroundColor = UIColor.grayColor()
    }
    
    //JP key actions
    @IBAction func upJPKeys(sender: UIButton) {
        if JPArrayIndex % 10 == 0 {
            JPArrayIndex += 9
        }else {
            JPArrayIndex--
        }
        redrawJPKeys()
    }
    
    @IBAction func downJPKeys(sender: UIButton) {
        JPArrayIndex++
        redrawJPKeys()
    }
    
    @IBAction func submitUSCharacter(sender: UIButton) {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        proxy.insertText(targettingUSKey.currentTitle!)
    }
    
    @IBAction func moveLeftJPKey(sender: UIButton) {
        if targettingJPTag == 0 {
            targettingJPTag += 4
        }else {
            targettingJPTag--
        }
        targettingJPKey = getNextTargetKey(targettingJPKey, targettingKeys: JPKeys, tag: targettingJPTag % 5 + 1)
        targettingJPKey.backgroundColor = UIColor.grayColor()
    }
    
    @IBAction func moveRightJPKey(sender: UIButton) {
        targettingJPTag++
        targettingJPKey = getNextTargetKey(targettingJPKey, targettingKeys: JPKeys, tag: targettingJPTag % 5 + 1)
        targettingJPKey.backgroundColor = UIColor.grayColor()
    }
    
    @IBAction func submitJPCharacter(sender: UIButton) {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        proxy.insertText(targettingJPKey.currentTitle!)
    }
    
    //Mark key actions
    @IBAction func swapMarkKey(sender: UIButton) {
        if halfStatus {
            halfStatus = false
        }else {
            halfStatus = true
        }
        redrawMarkKeys()
    }
    
    @IBAction func moveUpMarkKey(sender: UIButton) {
        if targettingMarkTag/9 == 0 {
            targettingMarkTag += 24
        }else {
            targettingMarkTag -= 8
        }
        targettingMarkKey = getNextTargetKey(targettingMarkKey, targettingKeys: markKeys, tag:targettingMarkTag)
        targettingMarkKey.backgroundColor = UIColor.grayColor()
    }
    
    @IBAction func moveDownMarkKey(sender: UIButton) {
        if targettingMarkTag/25 == 1 {
            targettingMarkTag -= 24
        }else {
            targettingMarkTag += 8
        }
        targettingMarkKey = getNextTargetKey(targettingMarkKey, targettingKeys: markKeys, tag:targettingMarkTag)
        targettingMarkKey.backgroundColor = UIColor.grayColor()
    }
    
    @IBAction func moveLeftMarkKey(sender: UIButton) {
        if targettingMarkTag%8 == 1 {
            targettingMarkTag += 7
        }else {
            targettingMarkTag--
        }
        targettingMarkKey = getNextTargetKey(targettingMarkKey, targettingKeys: markKeys, tag:targettingMarkTag)
        targettingMarkKey.backgroundColor = UIColor.grayColor()
    }
    
    @IBAction func moveRightMarkKey(sender: UIButton) {
        if targettingMarkTag%8 == 0 {
            targettingMarkTag -= 7
        }else {
            targettingMarkTag++
        }
        targettingMarkKey = getNextTargetKey(targettingMarkKey, targettingKeys: markKeys, tag:targettingMarkTag)
        targettingMarkKey.backgroundColor = UIColor.grayColor()
    }
    
    @IBAction func submitMarkCharacter(sender: UIButton) {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        proxy.insertText(targettingMarkKey.currentTitle!)
    }
    
    //share key actions
    @IBAction func inputCharacter(sender: UIButton) {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        proxy.insertText(sender.currentTitle!)
    }
    
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
