//
//  PeekPagedScrollViewController.swift
//  ScrollViews
//
//

import UIKit

class SuggestionsViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var scrollView: UIScrollView!
    
    //var pageImages: [UIImage] = []
    //var pageViews: [UIImageView?] = []
    
    var pageViews: [UIView?] = []
    var collectionPageViews:[UIView?] = []
    
    var cardView: UIView!
    var cardView2: UIView!
    var back: UIImageView!
    var front: UIImageView!
    var back2: UIImageView!
    var front2: UIImageView!
    var showingBack1 = true
    var showingBack2 = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //This part is copied, try to edit
        
        let tap1 = UITapGestureRecognizer(target: self, action: Selector("tapped1"))
        tap1.numberOfTapsRequired = 1
        
        var frame = scrollView.bounds
        front = UIImageView(image: UIImage(named: "photo1.png"))
        front.frame = frame
        back = UIImageView(image: UIImage(named: "photo2.png"))
        back.frame = frame
        cardView = UIView()
        cardView.addGestureRecognizer(tap1)
        cardView.userInteractionEnabled = true
        cardView.addSubview(front)
        cardView.addSubview(back)
        
        let tap2 = UITapGestureRecognizer(target: self, action: Selector("tapped2"))
        tap2.numberOfTapsRequired = 1
        front2 = UIImageView(image: UIImage(named: "photo3.png"))
        back2 = UIImageView(image: UIImage(named: "photo4.png"))
        front2.frame = frame
        back2.frame = frame
        cardView2 = UIView()
        cardView2.addGestureRecognizer(tap2)
        cardView2.userInteractionEnabled = true
        cardView2.addSubview(back2)
        
        pageViews = [cardView,cardView2]
        
        let pageCount = pageViews.count
        
        // Set up the array to hold the views for each page
        for _ in 0..<pageCount {
            collectionPageViews.append(nil)
        }
        
        // Set up the content size of the scroll view
        let pagesScrollViewSize = scrollView.frame.size
        scrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * CGFloat(pageViews.count), pagesScrollViewSize.height)
        
        // Load the initial set of pages that are on screen
        loadVisiblePages()
    }
    
    
    //this part is copied, try to edit.
    
    func tapped1() {
        if (showingBack1) {
            UIView.transitionFromView(back, toView: front, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromRight, completion: nil)
            showingBack1 = false
            let w = self.cardView.frame.size.width
            let h = self.cardView.frame.size.height
            let button   = UIButton.buttonWithType(UIButtonType.System) as UIButton
            button.frame = CGRectMake(0.2*w, 0.7*h, 0.2*w, 0.1*h)
            button.backgroundColor = UIColor.greenColor()
            button.setTitle("Phone", forState: UIControlState.Normal)
            let button2   = UIButton.buttonWithType(UIButtonType.System) as UIButton
            button2.frame = CGRectMake(0.6*w, 0.7*h, 0.2*w, 0.1*h)
            button2.backgroundColor = UIColor.blueColor()
            button2.setTitle("Calendar", forState: UIControlState.Normal)
            //button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
            cardView.addSubview(button)
            cardView.addSubview(button2)
        } else {
            UIView.transitionFromView(front, toView: back, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: nil)
            showingBack1 = true
        }
    }
    
    func tapped2() {
        if (showingBack2) {
            UIView.transitionFromView(back2, toView: front2, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromRight, completion: nil)
            showingBack2 = false
        } else {
            UIView.transitionFromView(front2, toView: back2, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: nil)
            showingBack2 = true
        }
    }
    
    
    func loadPage(page: Int) {
        
        if page < 0 || page >= pageViews.count {
            // If it's outside the range of what you have to display, then do nothing
            return
        }
        
        // Load an individual page, first checking if you've already loaded it
        if let pageView = collectionPageViews[page] {
            // Do nothing. The view is already loaded.
        } else {
            var frame = scrollView.bounds
            frame.origin.x = frame.size.width * CGFloat(page)
            frame.origin.y = 0.0
            frame = CGRectInset(frame, 10.0, 0.0)
            
            let newPageView = pageViews[page] //EXTRACT THE IMAGE FROM THE UI VIEW. LOAD UI VIEWS INTO THE THING INSTEAD.
            
            newPageView!.contentMode = UIViewContentMode.ScaleToFill
            newPageView!.frame = frame
            newPageView!.clipsToBounds = true
            newPageView!.autoresizesSubviews = true
            scrollView.addSubview(newPageView!) //INSTEAD OF ADDING A UI IMAGE VIEW, ADD A UIVIEW WITH EMBEDDED UIIMAGEVIEWS
            collectionPageViews[page] = newPageView
        }
    }
    
    func purgePage(page: Int) {
        
        
        if page < 0 || page >= pageViews.count {
            // If it's outside the range of what you have to display, then do nothing
            return
        }
        
        // Remove a page from the scroll view and reset the container array
        if let pageView = pageViews[page] {
            pageView.removeFromSuperview()
            pageViews[page] = nil
        }
        
    }
    
    func loadVisiblePages() {
        
        // First, determine which page is currently visible
        let pageWidth = scrollView.frame.size.width
        let page = Int(floor((scrollView.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0)))
        
        
        // Work out which pages you want to load
        let firstPage = page - 1
        let lastPage = page + 1
        
        
        // Purge anything before the first page
        for var index = 0; index < firstPage; ++index {
            purgePage(index)
        }
        
        // Load pages in our range
        for var index = firstPage; index <= lastPage; ++index {
            loadPage(index)
        }
        
        // Purge anything after the last page
        for var index = lastPage+1; index < pageViews.count; ++index {
            purgePage(index)
        }
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        // Load the pages that are now on screen
        loadVisiblePages()
        if !showingBack1{
            cardView.transitionFromView(front, toView: back, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: nil)
            showingBack1 = true
        }
        if !showingBack2{
            cardView2.transitionFromView(front2, toView: back2, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: nil)
            showingBack1 = true
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
