//
//  ViewController.swift
//  CenteredAutoLayoutButton
//
//  Created by Michael Mellinger on 8/14/14.
//  Copyright (c) 2014 h4labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var centeredButton: UIButton!

    
    func addButton() {
        centeredButton = UIButton()
        centeredButton.setTitle("Am I centered?", forState: .Normal)
        centeredButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        centeredButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        centeredButton.addTarget(self, action: "pressed:", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(centeredButton)
        
        var viewDictionary:Dictionary = ["centeredButton": centeredButton]
        
        let horizontal:[AnyObject]! = NSLayoutConstraint.constraintsWithVisualFormat("H:|-50-[centeredButton]-50-|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewDictionary)
        
        let vertical:[AnyObject]! = NSLayoutConstraint.constraintsWithVisualFormat("V:|-100-[centeredButton]-100-|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewDictionary)
        self.view.addConstraints(horizontal)
        self.view.addConstraints(vertical)
        
    }
    
    func pressed(sender: UIButton!) {
        var alertView = UIAlertView();
        alertView.addButtonWithTitle("Ok");
        alertView.title = "My Title";
        alertView.message = "Congratulations";
        alertView.show();
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

