//
//  CheckInViewController.swift
//  ScrollViews
//
//  Created by Aaron Loh on 24/2/15.
//  Copyright (c) 2015 Skyrocket Software. All rights reserved.
//
import UIKit

class CheckInViewController: UIViewController {
 
    //constraints for when keyboard comes up
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint2: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint3: NSLayoutConstraint!
    
    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func sendButton(sender: UIButton) {
        textField.text=""
        //change image to reflect new text
        backgroundImg.image = UIImage(named:"checkinafter.png")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //detect if keyboard is shown
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWasShown:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self);
    }
    
    
    //shifting the text bar up to fit keyboard
    func keyboardWasShown(notification: NSNotification) {
        var info = notification.userInfo!
        var keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue()
        
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.bottomConstraint.constant = keyboardFrame.size.height - 40
            self.bottomConstraint2.constant = keyboardFrame.size.height - 40
            self.bottomConstraint3.constant = -1*keyboardFrame.size.height + 50
        })
    }
    
    //shifting text bar down to fit screen
    func keyboardWillHide(notification: NSNotification) {
        var info = notification.userInfo!
        
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.bottomConstraint.constant =  8
            self.bottomConstraint2.constant =  8
            self.bottomConstraint3.constant = 0
        })
    }

}