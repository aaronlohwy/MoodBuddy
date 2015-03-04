//
//  NavigationViewController.swift
//  MoodBuddy
//
//  Created by Aaron Loh on 4/3/15.
//  Copyright (c) 2015 Aaron Loh. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController, UIViewControllerTransitioningDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Status bar white font
        self.navigationBar.barStyle = UIBarStyle.Black
        self.navigationBar.tintColor = UIColor.whiteColor()
    }
}