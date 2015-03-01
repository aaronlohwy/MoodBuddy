//
//  PageContentViewController.swift
//  MoodBuddy
//
//  Created by Aaron Loh on 1/3/15.
//  Copyright (c) 2015 Aaron Loh. All rights reserved.
//

// --- Sample code adapted from http://shrikar.com/blog/2015/01/17/ios-swift-tutorial-uipageviewcontroller-as-user-onboarding-tool/ --


import UIKit

class PageContentViewController: UIViewController{


    @IBOutlet weak var heading: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    var pageIndex: Int?
    var titleText: String!
    var imageName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backgroundImageView.image = UIImage(named: imageName)
        self.heading.text = self.titleText
        self.heading.alpha = 0.1
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.heading.alpha = 1.0
        })
    }
}