//
//  SongsTableTableViewController.swift
//  Jtabs
//
//  Created by High Jumper on 10/11/16.
//  Copyright © 2016 High Jumper. All rights reserved.
//
import Foundation
import UIKit

class SongsTableViewController:UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UITextFieldDelegate{
    
    @IBOutlet var mtable: UITableView!
    @IBOutlet var msearchBar: UISearchBar!
    
    let indexTitles = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    var sections = [String]()
    var songs = [[Song]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.filterSong(name: "")
    }
    
    // table view
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sections
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int {
        return songs[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongsCell", for: indexPath as IndexPath)
        
        let song = songs[indexPath.section][indexPath.row]

        let songName = song.title
        let artistName = song.artist!.name
        let coverArt = song.artist!.coverArt
        cell.textLabel?.text = songName
        cell.detailTextLabel?.text = artistName
        cell.imageView?.image = UIImage(named: coverArt)

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SendDataSegue" {
            
            let destination = segue.destination as? ChordViewController
            let indexPath = mtable.indexPathForSelectedRow!
            let song = songs[indexPath.section][indexPath.row]
            destination?.song = song
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    // MARK: - UISearchBarDelegate
    
    internal func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filterSong(name: searchText)
    }
    
    internal func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        self.msearchBar.resignFirstResponder()
    }
    
    internal func searchBarCancelButtonClicked(_ searchBar: UISearchBar){
        self.msearchBar.resignFirstResponder()
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(true, animated: true)
        return true
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(false, animated: true)
        return true
    }
    
    // filter 
    
    func filterSong(name: String) {
        sections.removeAll()
        songs.removeAll()
        
        let allSongs = MusicDataSource.songs.sorted(by: { $0.title < $1.title })
        
        for song in allSongs {
            
            if !name.isEmpty && !song.title.hasPrefix(name) {
                continue
            }
            
            let prefix = String(song.title.characters.prefix(1)).uppercased()
            if sections.count == 0 || sections.last! != prefix {
                var songList = [Song]()
                songList.append(song)
                sections.append(prefix)
                songs.append(songList)
            } else {
                var songList = songs.last!
                songList.append(song)
                songs[songs.endIndex - 1] = songList
            }
        }
        
        mtable.reloadData()
    }
}

