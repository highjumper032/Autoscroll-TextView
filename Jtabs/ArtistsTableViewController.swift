//
//  ArtistsTableViewController.swift
//  TableExample
//
//  Created by High Jumper on 10/6/16.
//  Copyright © 2016 Example. All rights reserved.
//

import UIKit



class ArtistsTableViewController:UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UITextFieldDelegate {
    
    @IBOutlet var mtable: UITableView!
    @IBOutlet var msearchBar: UISearchBar!
    
    var ArtistsArray: [String] {
        var ArrayToReturn: Array<String> = []
        for index in 0..<MusicDataSource.artists.count{
            ArrayToReturn.append(MusicDataSource.artists[index].name)
        }
        return ArrayToReturn
        
    }

    class FilterArtists{
        let filteredArtistsName : String
        let filteredSongsByArtistCount : Int
        var filteredIndex : Int
        let filteredCoverArt: String
        
        init(filteredArtistsName: String, filteredSongsByArtistCount:Int, filteredIndex:Int, filteredCoverArt: String){
            self.filteredArtistsName = filteredArtistsName
            self.filteredSongsByArtistCount = filteredSongsByArtistCount
            self.filteredIndex = filteredIndex
            self.filteredCoverArt = filteredCoverArt
            
        }
    }
    
    struct Section{
        var songs = [FilterArtists]()
        mutating func addSong(_ song: FilterArtists) {
            songs.append(song)
        }
    }
    
    var filterArtistsList = [FilterArtists]()
    var sections = [Section]()
    let indexTitles = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var sectionRows = [Int]()
    var sectionTitles = [String]()
    
    
    func filterArtistsFun(name: String){
        if name == "" {
            filterArtistsList.removeAll()
            for i in 0...MusicDataSource.artists.count - 1{
                filterArtistsList.append(FilterArtists(filteredArtistsName: MusicDataSource.artists[i].name, filteredSongsByArtistCount: (MusicDataSource.artists[i].songs?.count)!, filteredIndex: i, filteredCoverArt: MusicDataSource.artists[i].coverArt ))
            }
            filterArtistsList = filterArtistsList.sorted{$0.filteredArtistsName < $1.filteredArtistsName}
            sections.removeAll()
            sectionRows.removeAll()
            sectionTitles.removeAll()
            for i in 0...indexTitles.count-1 {
                var temp = Section()
                for j in 0...filterArtistsList.count-1{
                    if filterArtistsList[j].filteredArtistsName.hasPrefix(indexTitles[i]) {
                        temp.addSong(filterArtistsList[j])
                    }
                }
                if temp.songs.count > 0{
                    sections.append(temp)
                    sectionRows.append(temp.songs.count)
                    sectionTitles.append(indexTitles[i])
                    temp.songs.removeAll()
                }
            }
            mtable.reloadData();
        }
        else {
            filterArtistsList.removeAll()
            for i in 0...MusicDataSource.artists.count - 1{
                if MusicDataSource.artists[i].name.hasPrefix(name) {
                    filterArtistsList.append(FilterArtists(filteredArtistsName: MusicDataSource.artists[i].name, filteredSongsByArtistCount: (MusicDataSource.artists[i].songs?.count)!, filteredIndex: i, filteredCoverArt: MusicDataSource.artists[i].coverArt ))
                }
            }
            filterArtistsList = filterArtistsList.sorted{$0.filteredArtistsName < $1.filteredArtistsName}
            sections.removeAll()
            sectionRows.removeAll()
            sectionTitles.removeAll()
            if filterArtistsList.count > 0{
                for i in 0...indexTitles.count-1 {
                    var temp = Section()
                    for j in 0...filterArtistsList.count-1{
                        if filterArtistsList[j].filteredArtistsName.hasPrefix(indexTitles[i]) {
                        temp.addSong(filterArtistsList[j])
                        }
                    }
                    if temp.songs.count > 0{
                        sections.append(temp)
                        sectionRows.append(temp.songs.count)
                        sectionTitles.append(indexTitles[i])
                        temp.songs.removeAll()
                    }
                }
            }
            mtable.reloadData();
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SendDataSegue" {
            let destination = segue.destination as? SongsByArtistTableViewController
            let indexPath = mtable.indexPathForSelectedRow
            destination?.viaSegue = IndexPath(row: sections[indexPath!.section].songs[(indexPath?.row)!].filteredIndex, section: 0)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.filterArtistsFun(name: "")
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArtistsCell", for: indexPath)

        let artistName = sections[indexPath.section].songs[indexPath.row].filteredArtistsName
        let SongsByArtistCount = sections[indexPath.section].songs[indexPath.row].filteredSongsByArtistCount
        let coverArt = sections[indexPath.section].songs[indexPath.row].filteredCoverArt
        cell.textLabel?.text = artistName
        if SongsByArtistCount > 1 {
            cell.detailTextLabel?.text = "\(SongsByArtistCount) Songs"
        }else {
            cell.detailTextLabel?.text = "\(SongsByArtistCount) Song"
        }
        cell.imageView?.image = UIImage(named: coverArt )
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int {
        return sectionRows[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionTitles
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "SendDataSegue", sender: self);
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - UISearchBarDelegate
    
    internal func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
            self.filterArtistsFun(name: "")
        }
        else {
            self.filterArtistsFun(name: searchText)
        }
        
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
}
