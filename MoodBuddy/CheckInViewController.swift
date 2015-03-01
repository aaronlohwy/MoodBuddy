//
//  CheckInViewController.swift
//  ScrollViews
//
//  Created by Aaron Loh on 24/2/15.
//  Copyright (c) 2015 Skyrocket Software. All rights reserved.
//
import UIKit

class CheckInViewController: UIViewController {
 
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var bottomConstraint2: NSLayoutConstraint!

    @IBOutlet weak var reply: UITextView!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var appreply: UITextView!
    
    @IBOutlet weak var YesButton: UIButton!
    
    @IBOutlet weak var NoButton: UIButton!
    
    @IBAction func sendButton(sender: UIButton) {
        let text = textField.text
        reply.text = text
        
        reply.sizeToFit()
        reply.layoutIfNeeded()
        let height = reply.sizeThatFits(CGSizeMake(reply.frame.size.width, CGFloat.max)).height
        reply.contentSize.height = height
        reply.backgroundColor = UIColor.blueColor()
        textField.text=""
        appreply.text = "Sounds like you had a good lunch with Sarah today, and that you managed to get a lot of work done. Does that sound about right?"
        YesButton.setTitle("Yes",forState: UIControlState.Normal)
        NoButton.setTitle("No",forState: UIControlState.Normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWasShown:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self);
    }
    
    
    func keyboardWasShown(notification: NSNotification) {
        var info = notification.userInfo!
        var keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue()
        
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.bottomConstraint.constant = keyboardFrame.size.height - 20
            self.bottomConstraint2.constant = keyboardFrame.size.height - 20
        })
    }
    
    func keyboardWillHide(notification: NSNotification) {
        var info = notification.userInfo!
        
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.bottomConstraint.constant =  20
            self.bottomConstraint2.constant =  20
        })
    }

}