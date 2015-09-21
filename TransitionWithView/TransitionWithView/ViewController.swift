//
//  ViewController.swift
//  TransitionWithView
//
//  Created by Michael Mellinger on 4/28/15.
//  Copyright (c) 2015 h4labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
/*
   Need to use a container as described here:
    
    http://stackoverflow.com/questions/29923061/trying-to-curl-up-curl-down-with-two-views-using-autolayout-in-swift?noredirect=1#comment47975892_29923061
    
    http://stackoverflow.com/questions/9524048/how-to-flip-an-individual-uiview-without-flipping-the-parent-view
    
*/
    var container:UIView! // Place cardFront/cardBack in this container

    var cardFront:UIView!
    var cardBack:UIView!
    
    func centerViewXY(parent: UIView, child: UIView) {
        
        let constX = NSLayoutConstraint(item: child, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: parent, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        parent.addConstraint(constX)
        
        let constY = NSLayoutConstraint(item: child, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: parent, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0)
        parent.addConstraint(constY)
        
    }
    
    func addStandardConstraints(view:UIView, constraint:String, viewDictionary:Dictionary<String,UIView!>, metrics:Dictionary<String, Int>) {
        
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(constraint, options: [], metrics: metrics, views: viewDictionary))
        
    }
    
    func curlUp() {
        let transitionOptions = UIViewAnimationOptions.TransitionCurlUp
        
        UIView.transitionFromView(cardFront,
            toView: cardBack,
            duration: 5.0,
            options: transitionOptions,
            completion: { _ in
                
                let transitionOptions = UIViewAnimationOptions.TransitionCurlDown

                UIView.transitionFromView(self.cardBack,
                    toView: self.cardFront,
                    duration: 5.0,
                    options: transitionOptions,
                    completion: { _ in
                        //
                })

        })
    
    }
    
    func buildView() {

        let height = 100
        let width = 100

        container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = UIColor.blackColor()
        self.view.addSubview(container)
        
        cardBack = UIView(frame: CGRectMake(0, 0, CGFloat(width), CGFloat(height)))
        cardBack.backgroundColor = UIColor.redColor()
        container.addSubview(cardBack)
        
        cardFront = UIView(frame: CGRectMake(0, 0, CGFloat(width), CGFloat(height)))
        cardFront.backgroundColor = UIColor.greenColor()
        container.addSubview(cardFront)
        

        let viewDictionary:Dictionary<String,UIView> = ["container": container]

        let metrics:Dictionary<String,Int> = ["width": width, "height": height]

        let h0Constraint = "H:[container(==width)]"
        let v0Constraint = "V:[container(==height)]"
        
        addStandardConstraints(self.view, constraint: h0Constraint, viewDictionary: viewDictionary, metrics: metrics)
        addStandardConstraints(self.view, constraint: v0Constraint, viewDictionary: viewDictionary, metrics: metrics)
        
        centerViewXY(self.view, child: container)
        
        NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "curlUp", userInfo: nil, repeats: false)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.purpleColor()
        buildView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

