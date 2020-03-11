//
//  TableViewController.swift
//  vc
//
//  Created by Dhruvik Chevli on 09/02/20.
//  Copyright © 2020 Dhruvik Chevli. All rights reserved.
//

import UIKit
struct eachPhoto{
    var title: String
    var image: UIImage
    var likes: Int
    var comments: Int
}

class TableViewController: UITableViewController {
    let feeds = [
        eachPhoto(title:"image1",image: #imageLiteral(resourceName: "image2"),likes: 100, comments: 12),
        eachPhoto(title:"image2",image: #imageLiteral(resourceName: "image3"),likes:150,comments:5),
        eachPhoto(title:"image3",image: #imageLiteral(resourceName: "image1"),likes:13,comments:0),
        eachPhoto(title:"image4",image: #imageLiteral(resourceName: "image4") ,likes:2000,comments:100),
        eachPhoto(title:"image5",image: #imageLiteral(resourceName: "image5"),likes:1432,comments:150)
    ]
    //let tv=UITableView()
    fileprivate func extractedFunc() {
        //tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        //tv.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        //tableView.heightAnchor.constraint(equalToConstant: 3).isActive = true
        //tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        //tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true;
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    fileprivate func setUpTableView()
    {
        
        //view.addSubview(tv)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 300
        extractedFunc()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //title = "Insta"
        setUpTableView()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return feeds.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let photo=feeds[indexPath.row]
        cell.set(Photo: photo)
        
        // Configure the cell...

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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
