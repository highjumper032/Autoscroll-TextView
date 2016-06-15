//
//  SearchTableViewController.swift
//  Jtabs
//
//  Created by High Jumper on 10/18/16.
//  Copyright © 2016 High Jumper. All rights reserved.
//


import UIKit


class SearchTableViewController: UITableViewController, UISearchResultsUpdating {

    var appleProducts: [String] {
        var ArrayToReturn: Array<String> = []
    for index in 0..<MusicDataSource.songs.count{
            ArrayToReturn.append(MusicDataSource.songs[index].title)
        }
    return ArrayToReturn
        
    }

    var filteredAppleProducts = [String]()
    var resultSearchController = UISearchController()

    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.resultSearchController = UISearchController(searchResultsController: nil)
        self.resultSearchController.searchResultsUpdater = self
        self.resultSearchController.dimsBackgroundDuringPresentation = false
        self.resultSearchController.searchBar.sizeToFit()
        
        self.tableView.tableHeaderView = self.resultSearchController.searchBar
        
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if (self.resultSearchController.isActive)
        {
            return self.filteredAppleProducts.count
        }
        else
        {
            return self.appleProducts.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell?
        
        if (self.resultSearchController.isActive)
        {
            cell!.textLabel?.text = self.filteredAppleProducts[(indexPath as NSIndexPath).row]
            
            return cell!
        }
        else
        {
            cell!.textLabel?.text = self.appleProducts[(indexPath as NSIndexPath).row]
            
            return cell!
        }
    }
    
    func updateSearchResults(for searchController: UISearchController)
    {
        self.filteredAppleProducts.removeAll(keepingCapacity: false)
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (self.appleProducts as NSArray).filtered(using: searchPredicate)
        self.filteredAppleProducts = array as! [String]
        
        self.tableView.reloadData()
    }
    
    


}
