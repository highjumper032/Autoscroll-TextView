//
//  PlaylistsTableViewController.swift
//  Jtabs
//
//  Created by High Jumper on 10/20/16.
//  Copyright © 2016 High Jumper. All rights reserved.
//

import UIKit

class PlaylistsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
           return  MusicDataSource.playlists.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath)

        let playlistName = MusicDataSource.playlists[indexPath.row]
        cell.textLabel?.text = playlistName.titleName
        /*let numberOfSongsInPlaylist = MusicDataSource.playlists[indexPath.row].songs?.count
        cell.textLabel?.text = playlistName
       
        if numberOfSongsInPlaylist! > 1 {
        
         if numberOfSongsInPlaylist! > 1 {
            
            
            cell.detailTextLabel?.text = "\(numberOfSongsInPlaylist!) Songs"
        }
        else {
            cell.detailTextLabel?.text = "\(numberOfSongsInPlaylist!) Song"
        }
        }
        else {
            cell.detailTextLabel?.text = "There are no songs in this playlist"
        }*/
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     
        return true
    }
    

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

    
    // MARK: - Navigation

 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 if segue.identifier == "SendDataSegue" {
 
 
 
 let destination = segue.destination as? PlayListSongsTableViewController
 
 //let path = self.tableView.indexPathForSelectedRow
 // let cell = tableView.cellForRow(at: path!)
 let indexPath = self.tableView.indexPathForSelectedRow
 destination?.viaSegue = indexPath?.row
 
        }

    }

}
