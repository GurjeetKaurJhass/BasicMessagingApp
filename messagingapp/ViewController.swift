//
//  ViewController.swift
//  messagingapp
//
//  Created by Gurjeet kaur on 2020-01-25.
//  Copyright © 2020 The Lambton. All rights reserved.
//

import UIKit
import FirebaseDatabase
class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    var ref:DatabaseReference!
    var databaseHandler:DatabaseHandle?
    var postData = [String]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate=self
        tableView.dataSource=self
        //set the firebase reference
       ref = Database.database().reference()
        
        //retreive for posts and listen for changes
        
    databaseHandler = ref?.child("Posts").observe(.childAdded) { (DataSnapshot) in
    //execute when a new child is added
    //take the value from the snapshot and add it to the postdata.
        //convert data into string
        let post = DataSnapshot.value as? String
       
        if let actualPost = post
        {
            
            //apend the data to postData array
        self.postData.append(actualPost)
            //reload tableView
            self.tableView.reloadData()
        }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "postCell")
        cell?.textLabel?.text=postData[indexPath.row]
        return cell!
    }

}

