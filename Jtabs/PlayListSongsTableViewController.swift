//
//  PlayListSongsTableViewController.swift
//  Jtabs
//
//  Created by High Jumper on 10/20/16.
//  Copyright © 2016 High Jumper. All rights reserved.
//

import UIKit

class PlayListSongsTableViewController: UITableViewController {
    var viaSegue: Int? = 0
    
    @IBOutlet weak var navBar: UINavigationItem!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SendDataSegue" {
            
            
            
           // let destination = segue.destination as? ChordViewController
            
            //let path = self.tableView.indexPathForSelectedRow
            // let cell = tableView.cellForRow(at: path!)
           // let indexPath = self.tableView.indexPathForSelectedRow
            //destination?.viaSegue = indexPath?.row
        }
        }
    
    
    override func viewDidLoad() {
        self.navBar.title = MusicDataSource.playlists[viaSegue!].titleName
        
       super.viewDidLoad()
    }
    /*override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
     print("2")
     self.performSegue(withIdentifier: "SendDataSegue", sender: self);
     }*/
    
    
    
    
  
        
    

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
      
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return MusicDataSource.playlists[viaSegue!].songs!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaylistSongsCell", for: indexPath)
        //let songName = MusicDataSource.songs[indexPath.row].title
        //let artistName = MusicDataSource.songs[indexPath.row].artist?.name
        //cell.textLabel?.text = songName
        //cell.detailTextLabel?.text = artistName
        
        let song = MusicDataSource.playlists[viaSegue!].songs?[indexPath.row]
     let artistName = MusicDataSource.playlists[viaSegue!].songs?[indexPath.row].artist?.name
     cell.textLabel?.text = song?.title
     cell.detailTextLabel?.text = artistName

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
