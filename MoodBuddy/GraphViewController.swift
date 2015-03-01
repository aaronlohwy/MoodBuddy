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
        
        let image = UIImage(named: "pano.jpg")!
        panImageView = UIImageView(image: image)
        panImageView.frame = CGRect(origin: CGPointMake(0.0, 0.0), size:image.size)
        
        GraphScrollView.addSubview(panImageView)
        GraphScrollView.contentSize = image.size
        
        let scrollViewFrame = GraphScrollView.frame
        let scaleWidth = scrollViewFrame.size.width / GraphScrollView.contentSize.width
        let scaleHeight = scrollViewFrame.size.height / GraphScrollView.contentSize.height
        let minScale = min(scaleWidth, scaleHeight);
        GraphScrollView.minimumZoomScale = scaleHeight;
        GraphScrollView.maximumZoomScale = 1;
        
        GraphScrollView.zoomScale = scaleHeight;
    }
    
    
    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
        return panImageView
    }
    
    
}
