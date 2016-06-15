//
//  SongsByArtistViewController.swift
//  Jtabs
//
//  Created by High Jumper on 10/11/16.
//  Copyright © 2016 High Jumper. All rights reserved.
//

import UIKit

class SongsByArtistTableViewController: UITableViewController{
    var viaSegue: IndexPath = []
    var songs = [[Song]]()
    
    @IBOutlet var mtable: UITableView!
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SendDataSegue" {
            
            
            
            
            let path = self.tableView.indexPathForSelectedRow
            let cell = tableView.cellForRow(at: path!)?.detailTextLabel?.text
            if let start = indexPath(cell
            //if let start = MusicDataSource.songs[IndexPath].title.(where: {$0.title == (cell)! as String}) {
                let indexPath = start
                let destination = segue.destination as? ChordViewController
                destination?.viaSegue = indexPath.row
            }
            //let indexPath = self.tableView.indexPathForSelectedRow
            //destination?.viaSegue = indexPath?.row
            
        }
    }*/
    @IBOutlet weak var navBar: UINavigationItem!
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SendDataSegue" {
            
            
            
            let destination = segue.destination as? ChordViewFromArtist
            
            //let path = self.tableView.indexPathForSelectedRow
            // let cell = tableView.cellForRow(at: path!)
            let indexPath = self.tableView.indexPathForSelectedRow
            let song = songs[(indexPath?.row)!]
            destination?.song = song
            destination?.viaSegue = viaSegue.row
            destination?.songIndex = indexPath?.row
            
        }
    }*/

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       self.navBar.title = "Songs By " + (MusicDataSource.artists[viaSegue.row].name)
        
        
    }
   // @IBOutlet weak var navBar: UINavigationItem!
    
    
    
    
    //var artists = [altira!.artist, anildodi!.artist, animzmirot!.artist ]
    //var songs = [altira!.title, anildodi!.title, animzmirot!.title]
    //var artists: Array<String> = aartist()
    
    
    // MARK: - UITableViewDataSource
    
   
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MusicDataSource.artists[viaSegue.row].songs!.count
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongsByArtistCell", for: indexPath)
        
        let songName = MusicDataSource.artists[viaSegue.row].songs?[indexPath.row]
        cell.textLabel?.text = songName?.title
        //cell.detailTextLabel?.text = songs[indexPath.row]
        //cell.imageView?.image = UIImage(named: songName)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        //self.performSegue(withIdentifier: "SendDataSegue", sender: self);
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SendDataSegue" {
            
            let destination = segue.destination as? ChordViewController
            let indexPath = mtable.indexPathForSelectedRow!
            let song = MusicDataSource.artists[viaSegue.row].songs?[indexPath.row]
            destination?.song = song
        }
    }
    

}
    



