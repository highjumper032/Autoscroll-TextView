//
//  File.swift
//  Jtabs
//
//  Created by High Jumper on 10/15/16.
//  Copyright © 2016 High Jumper. All rights reserved.
//

import Foundation
import UIKit

public class Song {
    let title: String
    var artist: Artist?
    let chords: NSAttributedString?
    //var photo: UIImage?
    
    
    init(title: String, artist: Artist? = nil, chords:String){
        self.title = title
        self.artist = artist
        let rtfPath = Bundle.main.url(forResource: chords, withExtension: "rtf", subdirectory: "songFiles")!
        var d : NSDictionary? = nil
        let attributedStringWithRtf = try! NSAttributedString(
            url: rtfPath,
            options: [NSDocumentTypeDocumentAttribute : NSRTFTextDocumentType],
            documentAttributes: &d)
        self.chords = attributedStringWithRtf
        //self.photo = photo
        //load file into chord nsattributed string
    }
    
    
}

class Artist {
    let name: String
    let songs: [Song]?
    let coverArt: String
    
    init(name: String, songs: [Song]? = nil, coverArt: String) {
        self.songs = songs
        self.name = name
        self.coverArt = coverArt
        
        if let songs = songs {
            for song in songs {
                song.artist = self
            }
        }
    }
    
}

class Playlist {
    var titleName: String
    var songs: [Song]?
    
    
    init(titleName: String, songs: [Song]? = nil){
        self.titleName = titleName
        self.songs = songs
        
    }
}
