//
//  FormUsersViewController.swift
//  users
//
//  Created by Dhruvik Chevli on 20/03/20.
//  Copyright © 2020 Dhruvik Chevli. All rights reserved.
//

import UIKit
import Eureka

class FormUsersViewController: FormViewController {
    enum SubmitError:Error {
        case fieldsCannotBeNull
    }
    fileprivate func getVal(tags:String) throws ->String {
        let row: TextRow? = form.rowBy(tag:tags)
        guard let value = (row?.value) else{
            throw SubmitError.fieldsCannotBeNull
        }
        return value
    }
    
    @objc func addTapped()
    {
        let idRow: IntRow? = form.rowBy(tag: "id")
        let idr = idRow?.value ?? -1
        do{
        let name=try getVal(tags:"name")
        let username=try getVal(tags:"username")
        let city=try getVal(tags:"address")
        let phone=try getVal(tags:"phone")
        let website=try getVal(tags:"website")
        let company=try getVal(tags:"company")
        let cityinfo=cityInfo(city:city)
        let companyname=companyName(name: company)
        //form.setValues(["id":nil,"name":nil,"username":nil,"address":nil,"phone":nil,"website":nil,"company":nil])
        form.removeAll()
        createForm()
        let user=userInfo(id: idr, name: name, username: username, address: cityinfo, phone: phone, website: website, company: companyname)
        userList.listOfUsers?.insert(user, at: userList.listOfUsers?.endIndex ?? 0)
        //isUpdated = 1
        let notif = Notification.Name(rawValue: isUpdated)
        NotificationCenter.default.post(name: notif, object: nil)
        
        //print(userList.listOfUsers!)
        }
        catch {
            let alert = UIAlertController(title: "Fill the formly correctly", message: "Not all the fields are correctly filled", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        
        
    }
    fileprivate func createForm() {
        tableView.rowHeight=60
        //tableView.isFirstResponder() = true
        form
            +++ Section("User Info")
            //section.tag="User_Info"//2
            <<< IntRow() {row in
                row.title="Id"
                row.add(rule:RuleRequired())
                row.placeholder="00"
                row.tag="id"
                row.validationOptions = .validatesOnChange
            }
            .cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .systemRed
                }
            }
            <<< TextRow() { row in
                row.title = "Name"
                row.placeholder="name"
                row.add(rule:RuleRequired())
                row.tag="name"
                row.validationOptions = .validatesOnChange
            }
            .cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .systemRed
                }
            }
            <<< TextRow() { row in
                row.title = "Userame"
                row.placeholder="username"
                row.add(rule:RuleRequired())
                row.tag="username"
                row.validationOptions = .validatesOnChange
            }
            .cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .systemRed
                }
            }
            <<< TextRow() { row in
                row.title = "Address"
                row.placeholder="address"
                row.add(rule:RuleRequired())
                row.tag="address"
                row.validationOptions = .validatesOnChange
            }
            .cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .systemRed
                }
            }
            <<< TextRow() { row in
                row.title = "Phone"
                row.placeholder="XXXXXXXXXX"
                row.tag="phone"
                row.add(rule:RuleRequired())
                row.validationOptions = .validatesOnChange
            }
            .cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .systemRed
                }
            }
            <<< TextRow() { row in
                row.title = "Website"
                row.placeholder="abc@xyz.com"
                row.tag="website"
                row.validationOptions = .validatesOnChange
                row.add(rule:RuleRequired())
            }
            .cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .systemRed
                }
            }
            <<< TextRow() { row in
                row.title = "Company"
                row.placeholder="company"
                row.tag="company"
                row.add(rule:RuleRequired())
                row.validationOptions = .validatesOnChange
            }.cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .systemRed
                }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title="Add User"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        //navigationController?.navigationBar.prefersLargeTitles = true
        navigationController!.navigationBar.barStyle = .default
        navigationController!.navigationBar.isTranslucent = true
        self.navigationController!.navigationBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 1000.0)
        //navigationController!.navigationBar.heightAnchor.constraint(equalToConstant: 100).isActive = true
        createForm()

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
