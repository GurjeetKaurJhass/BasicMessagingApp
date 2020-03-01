//
//  ComposeViewController.swift
//  messagingapp
//
//  Created by Gurjeet kaur on 2020-01-26.
//  Copyright © 2020 The Lambton. All rights reserved.
//

import UIKit
import FirebaseDatabase
class ComposeViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    var ref: DatabaseReference!
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelPost(_ sender: Any) {
        
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    @IBAction func addPost(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
        ref?.child("Posts").childByAutoId().setValue(textView.text)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
