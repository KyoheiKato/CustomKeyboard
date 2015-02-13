//
//  JPKeyViewBuilder.swift
//  CustomKeyboard
//
//  Created by KYOHEI KATO on 1/27/15.
//  Copyright (c) 2015 KYOHEI KATO. All rights reserved.
//

import Foundation
import UIKit

class JPKeyViewController: BaseViewController {
    
    
    @IBOutlet var JPKeyButtons: [UIButton]!
    @IBOutlet weak var nextKeyboardButton: UIButton!
    @IBOutlet weak var moveUSKeyButton: UIButton!
    @IBOutlet var directionKeyButtons: [UIButton]!
    @IBOutlet weak var enterKeyButton: UIButton!

    
    let jpArray:[[String]] = [["あ", "い", "う", "え", "お"],
                              ["か", "き", "く", "け", "こ"],
                              ["さ", "し", "す", "せ", "そ"],
                              ["た", "ち", "つ", "て", "と"],
                              ["な", "に", "ぬ", "ね", "の"],
                              ["は", "ひ", "ふ", "へ", "ほ"],
                              ["ま", "み", "む", "め", "も"],
                              ["や", "", "ゆ", "", "よ"],
                              ["ら", "り", "る", "れ", "ろ"],
                              ["わ", "", "を", "", "ん"]]
    var displayingJP:[String]!
    var jpArrayIndex:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        initField()
    }
    
    func initField() {
        displayingJP = jpArray[jpArrayIndex]
        redrawTextButtons()
    }
    
    func redrawTextButtons() {
        for index in 0...4 {
            JPKeyButtons[index].setTitle(displayingJP[index], forState: UIControlState.Normal)
        }
    }
    
    @IBAction func upJPArray(sender: AnyObject) {
        if jpArrayIndex == 9 {
            jpArrayIndex = -1
        }
        displayingJP = jpArray[++jpArrayIndex]
        redrawTextButtons()
    }
    
    @IBAction func downJPArray(sender: AnyObject) {
        if jpArrayIndex == 0 {
            jpArrayIndex == 10
        }
        displayingJP = jpArray[--jpArrayIndex]
        redrawTextButtons()
    }    
    
    @IBAction func moveUSKeyView(sender: UIButton) {
        super.baseViewControllerDelegate.changeKeyView(sender)
    }
}