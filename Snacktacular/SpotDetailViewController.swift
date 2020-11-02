//
//  SpotDetailViewController.swift
//  Snacktacular
//
//  Created by Jennifer Joseph on 11/1/20.
//

import UIKit

class SpotDetailViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // @IBAction for Cancel Button
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        
        let isPresentingInAddMode = presentingViewController is UINavigationController
        
        // when this is true, we know it was presented by a Navigation Controller
        // which means it must have bene presented modally
        // which means we need to use a dismiss instead of a pop
        
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
}
