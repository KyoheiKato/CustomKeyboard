//
//  KeyboardViewController.swift
//  ArrowKeyboard
//
//  Created by KYOHEI KATO on 1/27/15.
//  Copyright (c) 2015 KYOHEI KATO. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController, CommonViewControllerDelegate {

    var keyViewControllers:[UIViewController]!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        self.view.addSubview(keyLayoutView)
    
    }
    
    func appendUIViews(){
        keyViewControllers.append(JPKeyViewController())
        keyViewControllers.append(USKeyViewController())
        
    }

    @IBAction func moveNextKeyboard(sender: AnyObject) {
        self.advanceToNextInputMode()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput) {
        // The app has just changed the document's contents, the document context has been updated.
    
        var textColor: UIColor
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }
    
    //MARK: CommonViewControllerDelegate
    func moveNextKeyboard() {
        self.advanceToNextInputMode()
    }
    
    func changeKeyView(senderTag: Int) {
        
    }

}
