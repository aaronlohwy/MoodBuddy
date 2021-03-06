//
//  ScrollViewContainer.swift
//  ScrollViews
//
// sample code adapted from http://www.raywenderlich.com/76436/use-uiscrollview-scroll-zoom-content-swift

import UIKit

class ScrollViewContainer: UIView {
    
    @IBOutlet var scrollView: UIScrollView!
    
    override func hitTest(point: CGPoint, withEvent event: UIEvent!) -> UIView? {
        
        let view = super.hitTest(point, withEvent: event)?
        if let theView = view {
            if theView == self {
                return scrollView
            }
        }
        
        return view
    }

}
