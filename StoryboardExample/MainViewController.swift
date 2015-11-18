//
//  MainViewController
//  StoryboardExample
//
//  Created by Matthew Canoy on 10/3/15.
//  Copyright © 2015 Matthew Canoy. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    /*
        var         - dictates that the object is of a variable state, meaning, it is allowed to be mutated (the other type is "let" which means it cannot be mutated afterwards)
        "objectName": "objectType"
    */
    var tapCount:Int = 0
    
    //let           - dictates the object is immutable (cannot change) aka Constant
    let tapCountString:String = "Tap Count:"

    /*
        @IBOutlet   - dictates that this element is connected to an IB (Interface Builder) file (XIB/"NIB", Storyboard)
        weak        - dictates that the object is weakly linked (99.999% of your IBOutlet objects should* be "assigned" weak
        !           - the ! essentially tells XCode to not worry about creating it and that we, the developer(s), will make sure it is setup properly ^_^. Because this is linked from an IBOutlet, the storyboard makes sure it is setup properly so the ! works just fine
    */
    @IBOutlet weak var tapCountLabel: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var textView: UITextView!
    
    //Note About Functions:
    /*
        Override - dictates that the function has been declared somewhere else and we are just changing/adding to what it does. (it obviously means much more than that, but for your needs, this is all you need to know
    
        func - dictates it is a function
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*
            This is called while the object is setting up itself.
            In this area it is common to change UI elements' (Label, TextView, Button, etc) colors, fonts, default text, etc.
        */
        
        //The slider changes the segmented control color :D
        slider.minimumValue = 0.0
        slider.maximumValue = 1.0
        slider.value = 0.0
        
        /*
            self<.>updateSegmentControlTintColor(0)
                "dot operator" "."    -   the dot operator allows you to access an object's properties (text, backgroundColor, etc) and functions (sizeToFit, sizeThatFits, etc)
            
            self                      -     refers to the object you are in. In this case, it is refering to the "MainViewController" ^ noted at the top of the file
        */
        self.updateSegmentControlTintColor(0)
        self.updateTapLabel()
    }
    
    func updateTapLabel() {
        /*
            \("objectHere")   -   this string syntax allows you to take objects (strings, numerical values, etc) and place them in order
        */
        tapCountLabel.text = "\(tapCountString)\(tapCount)"
    }

    /* 
        IBAction  -   dictates an Interface builder Action. Action is referring to a "control" action such as (valueDidChange, the various Touch Events, etc)
    
        (sender: UIButton) -> ("nameToReferToTheObjectBy":"objectType")
                  - when this IBAction is hit, it passes to you a reference variable "sender" if you wanted to do anything to it, or wanted to access any of its properties with the "." dot operator
    */
    @IBAction func increaseTapCount(sender: UIButton) {
        tapCount = tapCount+1 //Increasing the tapCount by 1 every button press
        
        //Updating the label with said value
        self.updateTapLabel()
    }
    
    @IBAction func switchValueChanged(sender: UISwitch) {
        //Switches have an On and Off state as opposed to the standard "selected" boolean which most controls utilize
        if sender.on == true {
            spinner.startAnimating()
        } else {
            spinner.stopAnimating()
        }
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        /**
            Here we are creating a new "UIColor" to set for our segmented control.
            red/green/blue/alpha all take a value from 0.0-1.0 NOT 0.0-255.0 
                HOWEVER: since you probably wanted a value between 0-255 use this ->    yourValueHere/255.0
            So when we get the sender's ("slider") value, it is something between 0 and 1
        */
        let sliderValue:CGFloat = CGFloat(sender.value) //sender.value is only a 'Float' so we needed to convert it
        //UIColor(red:,green: , blue: , alpha:) only accepts CGFloat's which is why we did the above ^
        self.updateSegmentControlTintColor(sliderValue)
    }
    
    func updateSegmentControlTintColor(value:CGFloat) {
        //Here we are only changing the green and blue values
        let newTintColor = UIColor(red:0.5, green:value, blue:value, alpha: 1)
        //the "tintColor" properly typically powers a lot of the standard UI control coloring aside from "backgroundColor"
        segmentedControl.tintColor = newTintColor
    }
}

