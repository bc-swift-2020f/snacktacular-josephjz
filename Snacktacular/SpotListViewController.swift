//
//  SpotListViewController.swift
//  Snacktacular
//
//  Created by Jennifer Joseph on 11/1/20.
//

import UIKit

class SpotListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!  // @IBOutlet connected to Table View in Spot List View Controller
    
    var spots = ["Island Creek Oysters", "El Pelon", "Shake Shack", "Pino's Pizza"]     // temporary string array of restaraunts just to make sure Table View is working

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self    // REMEMBER : ALWAYS DELEGATE AND DATASOURCE FOR BASIC TABLE VIEW IN A VIEW CONTROLLER
        
    }
}

// extenstion with Table View methods

extension SpotListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spots.count
    }
    
    // because we created a custom class where we subclassed UITableViewCell, we need to make sure here (in cellForRowAt) that we are setting up our cell as our new subclassed SpotTableViewCell and not UITableViewCell
    // this is done with "as! SpotTableViewCell" at the end of the cell declaration
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SpotTableViewCell   // remember: indexPath is passed in as parameter when this function gets called
        //cell.textLabel?.text = spots[indexPath.row]     // this is the old generic cell text
        cell.nameLabel?.text = spots[indexPath.row]       // this is the @IBOutlet in our custom celll 
        return cell
    }
    
    // for setting the Cell height in our Table View to 60, we first change this in the height inspector of the cell on mainstoryboard.swift, but we also need to add this function to our extension to do so
    // use code completion to remember this -- just have to start typing "height for row at"
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
