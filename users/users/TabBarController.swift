//
//  TabBarController.swift
//  UsersAPI
//
//  Created by Vedant Jain on 12/03/20.
//  Copyright © 2020 Dhruvik Chevli. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tableViewController = TableViewController()
        let navigationController = UINavigationController(rootViewController: tableViewController)
        navigationController.tabBarItem = UITabBarItem(title: "Users", image: UIImage(systemName: "person.fill"), tag: 0)
        let addUserViewController = FormUsersViewController()
        let addUserNavigationController = UINavigationController(rootViewController:addUserViewController)
        addUserNavigationController.tabBarItem = UITabBarItem(title:"Add Users",image: UIImage(systemName: "person.badge.plus.fill"),tag: 1)
        let addUser2ViewController = UserFormViewController()
        let addUser2NavigationController = UINavigationController(rootViewController: addUser2ViewController)
        addUser2NavigationController.tabBarItem = UITabBarItem(title:"Add Users",image:UIImage(systemName: "person.badge.plus.fill"),tag:2)
        viewControllers = [navigationController,addUserNavigationController,addUser2NavigationController]
        // Do any additional setup after loading the view.
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

