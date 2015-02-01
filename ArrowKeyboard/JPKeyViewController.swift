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
    
    @IBOutlet var InputTextButtons: [UIButton]!
    
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
    var jpArrayIndex:Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        initField()
    }
    
    func initField() {
        jpArrayIndex = 0
        displayingJP = jpArray[jpArrayIndex]
        for index in 0...4 {
            InputTextButtons[index].setTitle(displayingJP[index], forState:UIControlState.Normal)
        }
        
    }
    
    func redrawTextButtons() {
        for index in 0...4 {
            InputTextButtons[index].setTitle(displayingJP[index], forState: UIControlState.Normal)
        }
    }
    
    func upDisplayingJP() {
        if jpArrayIndex == 9 {
            jpArrayIndex = -1
        }
        displayingJP = jpArray[++jpArrayIndex]
        redrawTextButtons()
    }
    
    func downDisplayingJP() {
        if jpArrayIndex == 0 {
            jpArrayIndex == 10
        }
        displayingJP = jpArray[--jpArrayIndex]
        redrawTextButtons()
    }
    
    func pushTextButton(pushedButton:UIButton) {
        pushedButton.backgroundColor = UIColor.grayColor()
    }
    
    func unpushTextButton(pushedButton:UIButton) {
        pushedButton.backgroundColor = UIColor.whiteColor()
    }
}