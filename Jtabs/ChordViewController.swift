//
//  ChordViewController.swift
//  TableExample
//
//  Created by High Jumper on 10/9/16.
//  Copyright © 2016 Example. All rights reserved.
//

import UIKit

let DEFAULT_SPEED : CGFloat = 1.0
let SPEED_INTERVAL : CGFloat = 0.3


class ChordViewController: UIViewController{
    var song : Song!
    var speed : CGFloat = DEFAULT_SPEED
    var timer: Timer?
    var isPlay : Bool = false
    var scrollDelegate : UIScrollViewDelegate?
    
    @IBOutlet weak var chordView: UITextView!
    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var controlPad: UIView!
    
    @IBOutlet weak var rightFitConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("1")
        self.navBar.title = song.title
        chordView.attributedText = song.chords
        self.automaticallyAdjustsScrollViewInsets = false
        self.initScrollConfig()
        rightFitConstraint.constant = 56.0
        
        self.startTimerForAutoScroll()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        chordView.setContentOffset(CGPoint.zero, animated: false)
    }
    // Click play button
    @IBAction func AutoScroll(_ sender: UIBarButtonItem) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.setTabBarVisible(visible: false, animated: true)
        self.isPlay = true
        self.startScroll(isScroll: true)
        
        self.controlPadSlideIn()
    }
    // Click pause button
    @IBAction func stopAutoScroll(_ sender: UIButton) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.setTabBarVisible(visible: true, animated: true)
        self.initScrollConfig()
        self.startScroll(isScroll: false)
        self.controlPadSlideOut()
    }
    // SpeedUp AutoScroll
    @IBAction func speedUpScroll(_ sender: UIButton) {
        if isPlay == false || speed >= 5 {return}
        
        self.speed = speed + SPEED_INTERVAL
    }
    //SlowDown AutoScroll
    @IBAction func slowDownScroll(_ sender: UIButton) {
        if isPlay == false {return}
        self.speed = self.speed - SPEED_INTERVAL
        if self.speed < 0.2 {
            self.speed = 0.2
        }
    }
    func startTimerForAutoScroll() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { (timer) in
            let offset = CGPoint(x: 0.0 , y: self.chordView.contentOffset.y + self.speed)
            self.chordView.setContentOffset(offset, animated: false)
            //Stop scrolling when all contents are passed
            if self.chordView.contentOffset.y > self.chordView.contentSize.height - self.chordView.frame.height/2.0 {
                self.startScroll(isScroll: false)
                self.initScrollConfig()
            }
        }
    }
    //Start AutoScroll
    func startScroll(isScroll : Bool){
        if isScroll == true {
            self.speed = DEFAULT_SPEED
        } else {
            self.speed = 0.0
        }
    }
    
    // Configure all the parameter for autoscrolling
    func initScrollConfig(){
        self.speed = DEFAULT_SPEED
        self.isPlay = false
        self.startScroll(isScroll: false)
    }
    // Show/Hide tab bar
    func setTabBarVisible(visible:Bool, animated:Bool) {
        
        //* This cannot be called before viewDidLayoutSubviews(), because the frame is not set before this time
        
        // bail if the current state matches the desired state
        if (tabBarIsVisible() == visible) { return }
        
        // get a frame calculation ready
        let frame = self.tabBarController?.tabBar.frame
        let height = frame?.size.height
        let offsetY = (visible ? -height! : height)
        
        // zero duration means no animation
        let duration:TimeInterval = (animated ? 0.5 : 0.0)
        
        //  animate the tabBar
        if frame != nil {
            UIView.animate(withDuration: duration) {
                self.tabBarController?.tabBar.frame = frame!.offsetBy(dx: 0, dy: offsetY!)
                return
            }
        }
    }
    
    func tabBarIsVisible() ->Bool {
        return (self.tabBarController?.tabBar.frame.origin.y)! < self.view.frame.maxY
    }
    
    //Show control buttons
    func controlPadSlideOut() {
        UIView.animate(withDuration: 0.5) { 
            self.rightFitConstraint.constant = 56.0
            self.view.layoutIfNeeded();
        }
    }
    //Hide control buttons
    func controlPadSlideIn(){
        UIView.animate(withDuration: 0.5) {
            self.rightFitConstraint.constant = 0.0
            self.view.layoutIfNeeded();
        }
    }
    
    
    
    
}
