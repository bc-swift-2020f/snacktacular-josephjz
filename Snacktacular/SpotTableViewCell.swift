//
//  SpotTableViewCell.swift
//  Snacktacular
//
//  Created by Jennifer Joseph on 11/1/20.
//


// For creating a custom Table View Cell, created this file SpotTableViewCell.swift to subclass UITableViewCell
// This is a custom class with UITableViewCell subclassed

import UIKit

class SpotTableViewCell: UITableViewCell {
    // @IBOutlets for 3 labels in Table View Cell
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    
}
