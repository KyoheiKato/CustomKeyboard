//
//  JPKeyViewBuilder.swift
//  CustomKeyboard
//
//  Created by KYOHEI KATO on 1/27/15.
//  Copyright (c) 2015 KYOHEI KATO. All rights reserved.
//

import Foundation
import UIKit

class JPKeyView {
    
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
}