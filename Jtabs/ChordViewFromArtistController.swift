//
//  ViewController.swift
//  Jtabs
//
//  Created by High Jumper on 10/23/16.
//  Copyright © 2016 High Jumper. All rights reserved.
//

import UIKit

class ChordViewFromArtist: UIViewController {
    
    var song : Song!
        var viaSegue: Int? = 0
    
    var songIndex: Int? = 0
    
        
        
    
    @IBOutlet weak var chordView: UITextView!
    @IBOutlet weak var navBar: UINavigationItem!
        
        override func viewDidLoad() {
            
            self.navBar.title = song.title
            chordView.attributedText = song.chords
            /*let artist = viaSegue
            self.navBar.title = MusicDataSource.artists[artist!].songs?[songIndex!].title
            chordView.attributedText = MusicDataSource.artists[artist!].songs?[songIndex!].chords*/
            super.viewDidLoad()
            self.automaticallyAdjustsScrollViewInsets = false
            
            
            
            
            // Do any additional setup after loading the view.
        }
        
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        chordView.setContentOffset(CGPoint.zero, animated: false)
    }
    
        
}

