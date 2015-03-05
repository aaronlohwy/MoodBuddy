//
//  GraphViewController.swift
//  ScrollViews
//
//  Created by Aaron Loh on 24/2/15.
//  Copyright (c) 2015 Skyrocket Software. All rights reserved.
//

import UIKit

class GraphViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var GraphScrollView: UIScrollView!
    var panImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GraphScrollView.delegate=self
        
        //panning image
        let image = UIImage(named: "pano2.jpg")!
        panImageView = UIImageView(image: image)
        panImageView.frame = CGRect(origin: CGPointMake(0.0, 0.0), size:image.size)
        
        GraphScrollView.addSubview(panImageView)
        GraphScrollView.contentSize = image.size
        
        //Trying to find appropriate scale factor..
        //let ratio = GraphScrollView.contentSize.width / GraphScrollView.contentSize.height
        //let neededWidth = ratio * GraphScrollView.frame.size.height
        //let newArea = neededWidth * GraphScrollView.frame.size.height
        //let oldArea = GraphScrollView.contentSize.height * GraphScrollView.contentSize.width
        //let scaleFactor = oldArea / newArea
        
        let scrollViewFrame = GraphScrollView.frame
        let scaleWidth = scrollViewFrame.size.width / GraphScrollView.contentSize.width
        let scaleHeight = scrollViewFrame.size.height / GraphScrollView.contentSize.height
        let minScale = min(scaleWidth, scaleHeight);
        
        //play around with this to get the scale right:
        GraphScrollView.minimumZoomScale = scaleHeight+0.165
        GraphScrollView.maximumZoomScale = 1
        
        GraphScrollView.zoomScale = scaleHeight+0.165
    }
    
    
    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
        return panImageView
    }
    
    
}
