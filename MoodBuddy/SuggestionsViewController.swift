//
//  PeekPagedScrollViewController.swift
//  ScrollViews
//
// sample code adapted from http://www.raywenderlich.com/76436/use-uiscrollview-scroll-zoom-content-swift

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
    var showingFront1 = true
    var showingFront2 = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //This part is copied, try to edit
        
        let tap1 = UITapGestureRecognizer(target: self, action: Selector("tapped1"))
        tap1.numberOfTapsRequired = 1
        
        var frame = scrollView.bounds
        front = UIImageView(image: UIImage(named: "photo1.jpg"))
        front.frame = frame
        back = UIImageView(image: UIImage(named: "photo2.jpg"))
        back.frame = frame
        cardView = UIView()
        cardView.addGestureRecognizer(tap1)
        cardView.userInteractionEnabled = true
        cardView.addSubview(front)
        cardView.addSubview(back)
        
        let tap2 = UITapGestureRecognizer(target: self, action: Selector("tapped2"))
        tap2.numberOfTapsRequired = 1
        front2 = UIImageView(image: UIImage(named: "photo3.jpg"))
        back2 = UIImageView(image: UIImage(named: "photo4.jpg"))
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
    
    
    //Button Functions
    
    func tapped1() {
        if (showingFront1) {
            UIView.transitionFromView(back, toView: front, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromRight, completion: nil)
            showingFront1 = false
            let w = self.cardView.frame.size.width
            let h = self.cardView.frame.size.height
            
            let button   = UIButton.buttonWithType(UIButtonType.System) as UIButton
            let text = UIImage(named: "text.png") as UIImage!
            button.frame = CGRectMake(0.2*w, 0.7*h, 0.2*w, 0.2*w)
            button.setImage(text, forState: .Normal)
            button.imageView!.contentMode = UIViewContentMode.ScaleAspectFit;
            button.addTarget(self, action: "textpressed:", forControlEvents: UIControlEvents.TouchUpInside)
            
            let button2   = UIButton.buttonWithType(UIButtonType.System) as UIButton
            let calendar = UIImage(named: "calendar.png") as UIImage!
            button2.frame = CGRectMake(0.6*w, 0.7*h, 0.2*w, 0.2*w)
            button2.setImage(calendar, forState: .Normal)
            button2.imageView!.contentMode = UIViewContentMode.ScaleAspectFit;
            button2.addTarget(self, action: "calendarpressed:", forControlEvents: UIControlEvents.TouchUpInside)
            
            let button3   = UIButton.buttonWithType(UIButtonType.System) as UIButton
            let delete = UIImage(named: "cross.png") as UIImage!
            button3.frame = CGRectMake(0.8*w, 0.05*h, 0.1*w, 0.1*w)
            button3.setImage(delete, forState: .Normal)
            button3.imageView!.contentMode = UIViewContentMode.ScaleAspectFit;
            button3.addTarget(self, action: "deletepressed:", forControlEvents: UIControlEvents.TouchUpInside)
            
            cardView.addSubview(button)
            cardView.addSubview(button2)
            cardView.addSubview(button3)
        } else {
            UIView.transitionFromView(front, toView: back, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: nil)
            for view in self.cardView.subviews {
                view.removeFromSuperview()
            }
            cardView.addSubview(front)
            cardView.addSubview(back)
            showingFront1 = true
        }
    }
    
    func tapped2() {
        if (showingFront2) {
            UIView.transitionFromView(back2, toView: front2, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromRight, completion: nil)
            showingFront2 = false
            
            let w = self.cardView.frame.size.width
            let h = self.cardView.frame.size.height
            
            let button   = UIButton.buttonWithType(UIButtonType.System) as UIButton
            let text = UIImage(named: "text.png") as UIImage!
            button.frame = CGRectMake(0.2*w, 0.7*h, 0.2*w, 0.2*w)
            button.setImage(text, forState: .Normal)
            button.imageView!.contentMode = UIViewContentMode.ScaleAspectFit;
            button.addTarget(self, action: "textpressed:", forControlEvents: UIControlEvents.TouchUpInside)
            
            let button2   = UIButton.buttonWithType(UIButtonType.System) as UIButton
            let calendar = UIImage(named: "calendar.png") as UIImage!
            button2.frame = CGRectMake(0.6*w, 0.7*h, 0.2*w, 0.2*w)
            button2.setImage(calendar, forState: .Normal)
            button2.imageView!.contentMode = UIViewContentMode.ScaleAspectFit;
            button2.addTarget(self, action: "calendarpressed:", forControlEvents: UIControlEvents.TouchUpInside)
            
            let button3   = UIButton.buttonWithType(UIButtonType.System) as UIButton
            let delete = UIImage(named: "cross.png") as UIImage!
            button3.frame = CGRectMake(0.8*w, 0.05*h, 0.1*w, 0.1*w)
            button3.setImage(delete, forState: .Normal)
            button3.imageView!.contentMode = UIViewContentMode.ScaleAspectFit;
            button3.addTarget(self, action: "deletepressed:", forControlEvents: UIControlEvents.TouchUpInside)
            
            cardView2.addSubview(button)
            cardView2.addSubview(button2)
            cardView2.addSubview(button3)
        } else {
            UIView.transitionFromView(front2, toView: back2, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: nil)
            for view in self.cardView2.subviews {
                view.removeFromSuperview()
            }
            cardView2.addSubview(front2)
            cardView2.addSubview(back2)
            showingFront2 = true
        }
    }
    
    
    
    func textpressed(sender:UIButton!)
    {
        let alert = UIAlertView()
        alert.title = "Do you want to send a Message?"
        alert.message = "You will be redirected to iMessage"
        alert.addButtonWithTitle("Yes")
        alert.addButtonWithTitle("No")
        alert.show()
    }
    
    func calendarpressed(sender:UIButton!)
    {
        let alert = UIAlertView()
        alert.title = "Do you want to add this to your calendar?"
        alert.message = "You will be redirected to iCal"
        alert.addButtonWithTitle("Yes")
        alert.addButtonWithTitle("No")
        alert.show()
    }
    
    func deletepressed(sender:UIButton!)
    {
        let alert = UIAlertView()
        alert.title = "Do you want to delete this Suggestion?"
        alert.message = "This suggestion will not appear again"
        alert.addButtonWithTitle("Yes")
        alert.addButtonWithTitle("No")
        alert.delegate = self
        alert.show()
    }
    
    func alertView(alertView: UIAlertView!, clickedButtonAtIndex buttonIndex: Int){
        switch buttonIndex{
        case 0:
            removeCardView()
        case 1:
            break
        default:
            break
        }
    }
    
    
    func loadPage(page: Int) {
        
        if page < 0 || page >= pageViews.count {
            // If it's outside the range of what you have to display, then do nothing
            return
        }
        
        // Load an individual page, first checking if you've already loaded it
        //if let pageView = collectionPageViews[page] {
            // Do nothing. The view is already loaded.
        //} 
        else {
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
            //collectionPageViews[page] = newPageView
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
        if !showingFront1{
            tapped1()
        }
        if !showingFront2{
            tapped2()
        }
        
    }
    
    func removeCardView(){
        let pageWidth = scrollView.frame.size.width
        let page = Int(floor((scrollView.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0)))
        pageViews.removeAtIndex(page)
        for view in scrollView.subviews{
            view.removeFromSuperview()
        }
        let pagesScrollViewSize = scrollView.frame.size
        scrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * CGFloat(pageViews.count), pagesScrollViewSize.height)
        loadVisiblePages()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
