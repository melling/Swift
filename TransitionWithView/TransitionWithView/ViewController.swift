//
//  ViewController.swift
//  TransitionWithView
//
//  Created by Michael Mellinger on 4/28/15.
//  Copyright (c) 2015 h4labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var cardFront:UIView!
    var cardBack:UIView!
    
    func centerViewXY(parent: UIView, child: UIView) {
        
        var constX = NSLayoutConstraint(item: child, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: parent, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        parent.addConstraint(constX)
        
        var constY = NSLayoutConstraint(item: child, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: parent, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0)
        parent.addConstraint(constY)
        
    }
    
    func addStandardConstraints(aConstraint:String, viewDictionary:Dictionary<String,UIView!>, metrics:Dictionary<String, Int>) {
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(aConstraint, options: nil, metrics: metrics, views: viewDictionary))
        
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
        
        cardBack = UIView()
        cardBack.setTranslatesAutoresizingMaskIntoConstraints(false)
        cardBack.backgroundColor = UIColor.redColor()
        self.view.addSubview(cardBack)
        
        cardFront = UIView()
        cardFront.setTranslatesAutoresizingMaskIntoConstraints(false)
        cardFront.backgroundColor = UIColor.greenColor()
        self.view.addSubview(cardFront)
        
        let height = 50
        let width = 50
        
        let viewDictionary:Dictionary<String,UIView> = ["cardFront": cardFront, "cardBack": cardBack]

        let metrics:Dictionary<String,Int> = ["width": width, "height": height]
        let hConstraint = "H:[cardFront(==width)]"
        let vConstraint = "V:[cardFront(==height)]"
        
        addStandardConstraints(hConstraint, viewDictionary: viewDictionary, metrics: metrics)
        addStandardConstraints(vConstraint, viewDictionary: viewDictionary, metrics: metrics)

        centerViewXY(self.view, child: cardFront)

        let h1Constraint = "H:[cardBack(==width)]"
        let v1Constraint = "V:[cardBack(==height)]"

        addStandardConstraints(h1Constraint, viewDictionary: viewDictionary, metrics: metrics)
        addStandardConstraints(v1Constraint, viewDictionary: viewDictionary, metrics: metrics)

        centerViewXY(self.view, child: cardBack)
        
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

