//
//  TableViewController.swift
//  UsersAPI
//
//  Created by Dhruvik Chevli on 02/03/20.
//  Copyright © 2020 Dhruvik Chevli. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var listOfUsers = [userInfo](){
        didSet{
            DispatchQueue.main.async{
                self.tableView.reloadData()
                
            }
        }
    }
    func setUpTableView(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 231
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        
        title = "Users"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController!.navigationBar.barStyle = .default
        navigationController!.navigationBar.isTranslucent = true
    }
    func getusers()
    {
        let UserRequest = userRequest()
        UserRequest.getUsers{[weak self] result in
            switch result{
            case .failure(let error):
                print(error)
                print("Hi")
            case .success(let users):
                self?.listOfUsers = users
                //print(self?.listOfUsers ?? 0)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        getusers()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.listOfUsers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell

        let user = listOfUsers[indexPath.row]
        cell.set(res:user)
        return cell
    }
    
}
