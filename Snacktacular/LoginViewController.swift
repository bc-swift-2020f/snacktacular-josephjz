//
//  LoginViewController.swift
//  Snacktacular
//
//  Created by Jennifer Joseph on 11/1/20.
//

// entire code copied and pasted from https://gist.github.com/gallaugher/5613430b2e506dbd5053298d9d48948d

import UIKit
import FirebaseUI

class LoginViewController: UIViewController {
    
    var authUI: FUIAuth!    // this FUIAuth object includes all of Google's behind - the - scences data structures that handle                                    authentication

    override func viewDidLoad() {
        super.viewDidLoad()
        
        authUI = FUIAuth.defaultAuthUI()    // initializes FUIAuth object
        // You need to adopt a FUIAuthDelegate protocol to receive callback
        authUI.delegate = self  // delegate set up allows this code to send messages to our code in this view controller
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        signIn()
    }

    func signIn() {
        let providers: [FUIAuthProvider] = [
          FUIGoogleAuth(),
        ]   // this providers code creates the button for user to click for Google Sign In
        if authUI.auth?.currentUser == nil { // user has not signed in
            self.authUI.providers = providers // show providers named after let providers: above using pre built Google sign in login
            let loginViewController = authUI.authViewController()
            loginViewController.modalPresentationStyle = .fullScreen
            present(loginViewController, animated: true, completion: nil)
        } else { // user is already logged in
            performSegue(withIdentifier: "FirstShowSegue", sender: nil)
        }
    }
    
    func signOut() {
        do {
            try authUI!.signOut()
        } catch {
            print("😡 ERROR: couldn't sign out")
            performSegue(withIdentifier: "FirstShowSegue", sender: nil)
        }
    }
    
    @IBAction func unwindSignOutPressed(segue: UIStoryboardSegue) {
        if segue.identifier == "SignOutUnwind" {
            signOut()
        }
    }
}

extension LoginViewController: FUIAuthDelegate {
    func authPickerViewController(forAuthUI authUI: FUIAuth) -> FUIAuthPickerViewController {
        let marginInsets: CGFloat = 16.0 // amount to indent UIImageView on each side
        let topSafeArea = self.view.safeAreaInsets.top
        
        // Create an instance of the FirebaseAuth login view controller
        let loginViewController = FUIAuthPickerViewController(authUI: authUI)
        
        // Set background color to white
        loginViewController.view.backgroundColor = UIColor.white
        loginViewController.view.subviews[0].backgroundColor = UIColor.clear
        loginViewController.view.subviews[0].subviews[0].backgroundColor = UIColor.clear
        
        // Create a frame for a UIImageView to hold our logo
        let x = marginInsets
        let y = marginInsets + topSafeArea
        let width = self.view.frame.width - (marginInsets * 2)
        //        let height = loginViewController.view.subviews[0].frame.height - (topSafeArea) - (marginInsets * 2)
        let height = UIScreen.main.bounds.height - (topSafeArea) - (marginInsets * 2)
        
        let logoFrame = CGRect(x: x, y: y, width: width, height: height)
        
        // Create the UIImageView using the frame created above & add the "logo" image
        let logoImageView = UIImageView(frame: logoFrame)
        logoImageView.image = UIImage(named: "logo")
        logoImageView.contentMode = .scaleAspectFit // Set imageView to Aspect Fit
        loginViewController.view.addSubview(logoImageView) // Add ImageView to the login controller's main view
        return loginViewController
    }
}

