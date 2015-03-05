//
//  PeekPagedScrollViewController.swift
//  ScrollViews
//
// sample code for scrolling adapted from http://www.raywenderlich.com/76436/use-uiscrollview-scroll-zoom-content-swift

import UIKit

class SuggestionsViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var scrollView: UIScrollView!
    
    //var pageImages: [UIImage] = []
    //var pageViews: [UIImageView?] = []
    
    var pageViews: [UIView?] = []
    var collectionPageViews:[UIView?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var frame = scrollView.bounds
        
        //setting up cards
        let front = UIImageView(image: UIImage(named: "suggestion1.png"))
        front.frame = frame
        let cardView = UIView()
        cardView.addSubview(front)
        
        let front2 = UIImageView(image: UIImage(named: "suggestion2.png"))
        front2.frame = frame
        let cardView2 = UIView()
        cardView2.addSubview(front2)
        
        let front3 = UIImageView(image: UIImage(named: "suggestion3.png"))
        front3.frame = frame
        let cardView3 = UIView()
        cardView3.addSubview(front3)
        
        let front4 = UIImageView(image: UIImage(named: "suggestion4.png"))
        front4.frame = frame
        let cardView4 = UIView()
        cardView4.addSubview(front4)
    

        //BUTTONS
        let w = frame.size.width
        let h = frame.size.height
        
        //images for buttons
        let text = UIImage(named: "Speech Bubble.png") as UIImage!
        let calendar = UIImage(named: "Calendar.png") as UIImage!
        let map = UIImage(named: "Map Marker.png") as UIImage!
        let delete = UIImage(named: "cross.png") as UIImage!
        let heart = UIImage(named: "Heart Monitor.png") as UIImage!
        let music = UIImage(named: "Music.png") as UIImage!
        let alarm = UIImage(named: "Alarm Clock.png") as UIImage!
        
        //buttons for card 1
        let speech1   = UIButton.buttonWithType(UIButtonType.System) as UIButton
        speech1.frame = CGRectMake(0.20*w, 0.65*h, 0.15*w, 0.15*w)
        speech1.setImage(text, forState: .Normal)
        speech1.imageView!.contentMode = UIViewContentMode.ScaleAspectFit;
        speech1.addTarget(self, action: "textpressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        let cal1   = UIButton.buttonWithType(UIButtonType.System) as UIButton
        cal1.frame = CGRectMake(0.40*w, 0.65*h, 0.15*w, 0.15*w)
        cal1.setImage(calendar, forState: .Normal)
        cal1.imageView!.contentMode = UIViewContentMode.ScaleAspectFit;
        cal1.addTarget(self, action: "calendarpressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        let map1   = UIButton.buttonWithType(UIButtonType.System) as UIButton
        map1.frame = CGRectMake(0.60*w, 0.65*h, 0.15*w, 0.15*w)
        map1.setImage(map, forState: .Normal)
        map1.imageView!.contentMode = UIViewContentMode.ScaleAspectFit;
        map1.addTarget(self, action: "mappressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        let del1   = UIButton.buttonWithType(UIButtonType.System) as UIButton
        del1.frame = CGRectMake(0.85*w, 0.03*h, 0.05*w, 0.05*w)
        del1.setImage(delete, forState: .Normal)
        del1.imageView!.contentMode = UIViewContentMode.ScaleAspectFit;
        del1.addTarget(self, action: "deletepressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        //buttons for card 2
        let heart2   = UIButton.buttonWithType(UIButtonType.System) as UIButton
        heart2.frame = CGRectMake(0.3*w, 0.5*h, 0.15*w, 0.15*w)
        heart2.setImage(heart, forState: .Normal)
        heart2.imageView!.contentMode = UIViewContentMode.ScaleAspectFit;
        heart2.addTarget(self, action: "heartpressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        let map2   = UIButton.buttonWithType(UIButtonType.System) as UIButton
        map2.frame = CGRectMake(0.5*w, 0.5*h, 0.15*w, 0.15*w)
        map2.setImage(map, forState: .Normal)
        map2.imageView!.contentMode = UIViewContentMode.ScaleAspectFit;
        map2.addTarget(self, action: "mappressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        let del2   = UIButton.buttonWithType(UIButtonType.System) as UIButton
        del2.frame = CGRectMake(0.85*w, 0.03*h, 0.05*w, 0.05*w)
        del2.setImage(delete, forState: .Normal)
        del2.imageView!.contentMode = UIViewContentMode.ScaleAspectFit;
        del2.addTarget(self, action: "deletepressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        //buttons for card 3
        let speech3   = UIButton.buttonWithType(UIButtonType.System) as UIButton
        speech3.frame = CGRectMake(0.3*w, 0.5*h, 0.15*w, 0.15*w)
        speech3.setImage(text, forState: .Normal)
        speech3.imageView!.contentMode = UIViewContentMode.ScaleAspectFit;
        speech3.addTarget(self, action: "textpressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        let cal3   = UIButton.buttonWithType(UIButtonType.System) as UIButton
        cal3.frame = CGRectMake(0.5*w, 0.5*h, 0.15*w, 0.15*w)
        cal3.setImage(calendar, forState: .Normal)
        cal3.imageView!.contentMode = UIViewContentMode.ScaleAspectFit;
        cal3.addTarget(self, action: "calendarpressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        let del3   = UIButton.buttonWithType(UIButtonType.System) as UIButton
        del3.frame = CGRectMake(0.85*w, 0.03*h, 0.05*w, 0.05*w)
        del3.setImage(delete, forState: .Normal)
        del3.imageView!.contentMode = UIViewContentMode.ScaleAspectFit;
        del3.addTarget(self, action: "deletepressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        //buttons for card 4
        let music4   = UIButton.buttonWithType(UIButtonType.System) as UIButton
        music4.frame = CGRectMake(0.3*w, 0.5*h, 0.15*w, 0.15*w)
        music4.setImage(music, forState: .Normal)
        music4.imageView!.contentMode = UIViewContentMode.ScaleAspectFit;
        music4.addTarget(self, action: "musicpressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        let alarm4   = UIButton.buttonWithType(UIButtonType.System) as UIButton
        alarm4.frame = CGRectMake(0.5*w, 0.5*h, 0.15*w, 0.15*w)
        alarm4.setImage(alarm, forState: .Normal)
        alarm4.imageView!.contentMode = UIViewContentMode.ScaleAspectFit;
        alarm4.addTarget(self, action: "alarmpressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        let del4   = UIButton.buttonWithType(UIButtonType.System) as UIButton
        del4.frame = CGRectMake(0.85*w, 0.03*h, 0.05*w, 0.05*w)
        del4.setImage(delete, forState: .Normal)
        del4.imageView!.contentMode = UIViewContentMode.ScaleAspectFit;
        del4.addTarget(self, action: "deletepressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        //adding buttons to cards
        cardView.addSubview(speech1)
        cardView.addSubview(cal1)
        cardView.addSubview(map1)
        cardView.addSubview(del1)
        
        cardView2.addSubview(heart2)
        cardView2.addSubview(map2)
        cardView2.addSubview(del2)
        
        cardView3.addSubview(speech3)
        cardView3.addSubview(cal3)
        cardView3.addSubview(del3)
        
        cardView4.addSubview(music4)
        cardView4.addSubview(alarm4)
        cardView4.addSubview(del4)
        
        //adding cards to array
        pageViews = [cardView,cardView2,cardView3,cardView4]
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
    
    func mappressed(sender:UIButton!)
    {
        let alert = UIAlertView()
        alert.title = "Do you want to look for a place?"
        alert.message = "You will be redirected to Maps"
        alert.addButtonWithTitle("Yes")
        alert.addButtonWithTitle("No")
        alert.show()
    }
    
    func heartpressed(sender:UIButton!)
    {
        let alert = UIAlertView()
        alert.title = "Do you want to open your fitness tracker?"
        alert.message = "You will be redirected to Nike+"
        alert.addButtonWithTitle("Yes")
        alert.addButtonWithTitle("No")
        alert.show()
    }
    
    func musicpressed(sender:UIButton!)
    {
        let alert = UIAlertView()
        alert.title = "Do you want play some tunes?"
        alert.message = "You will be redirected to iTunes"
        alert.addButtonWithTitle("Yes")
        alert.addButtonWithTitle("No")
        alert.show()
    }
    
    func alarmpressed(sender:UIButton!)
    {
        let alert = UIAlertView()
        alert.title = "Do you want to set an alarm?"
        alert.message = "You will be redirected to Clock"
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
            collectionPageViews[page] = newPageView
        }
    }
    
    func purgePage(page: Int) {
        
        
        if page < 0 || page >= pageViews.count {
            // If it's outside the range of what you have to display, then do nothing
            return
        }
        
        // Remove a page from the scroll view and reset the container array
        if let pageView = collectionPageViews[page] {
            pageView.removeFromSuperview()
            collectionPageViews[page] = nil
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
