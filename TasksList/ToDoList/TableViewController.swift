//
//  TableViewController.swift
//  ToDoList
//
//  Created by Dhruvik Chevli on 23/02/20.
//  Copyright © 2020 Dhruvik Chevli. All rights reserved.
//

import UIKit
struct eachTask{
    var task: String
}
class TableViewController: UITableViewController {

    var Tasks = [
        eachTask(task:"XCode"),
        eachTask(task:"Swift"),
        eachTask(task:"Python"),
        eachTask(task:"CPP"),
        eachTask(task:"Java")
    ]
    fileprivate func setUpTableView()
    {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 80
        tableView.register(TableViewCell.self,forCellReuseIdentifier:"TableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        self.title = "To-Do List"
        self.navigationController!.navigationBar.barStyle = .default
        self.navigationController!.navigationBar.isTranslucent = true
        self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont(name: "AmericanTypewriter-Bold", size: 25)!]
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Task",
        style: .plain,
        target: self,
        action: #selector(rightHandAction))

        //self.navigationController!.navigationBar.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
    @objc
    func rightHandAction() {
        print("right bar button action")
        let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Enter a Task"
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
            print("Text field: \(String(describing: textField!.text))")
            self.Tasks.insert(eachTask(task:textField!.text!), at: self.Tasks.endIndex)
            self.tableView.reloadData()
        }))
        self.present(alert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        setUpTableView()
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            Tasks.remove(at:indexPath.row)
            tableView.reloadData()
            
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let task=Tasks[indexPath.row]
        cell.set(res:task)
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
