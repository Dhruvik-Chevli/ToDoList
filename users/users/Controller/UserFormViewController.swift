//
//  UserFormViewController.swift
//  users
//
//  Created by Dhruvik Chevli on 22/03/20.
//  Copyright © 2020 Dhruvik Chevli. All rights reserved.
//

import UIKit

fileprivate func setUpLabel(_ theLabel: UILabel) {
    theLabel.numberOfLines = 1
    theLabel.adjustsFontSizeToFitWidth = true
    theLabel.translatesAutoresizingMaskIntoConstraints = false
    theLabel.backgroundColor = UIColor(white: 0, alpha: 0.2)
    theLabel.textAlignment = .center
    theLabel.layer.masksToBounds = true
    theLabel.layer.cornerRadius = 5
}
fileprivate func setUpTextField(_ textField: UITextField,placeHolder: String) {
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.placeholder = placeHolder
    textField.keyboardType = UIKeyboardType.default
    textField.returnKeyType = UIReturnKeyType.done
    textField.autocorrectionType = UITextAutocorrectionType.no
    textField.font = UIFont.systemFont(ofSize: 20)
    textField.borderStyle = UITextField.BorderStyle.roundedRect
    //textField.tintColor = .black
    //textField.setIcon(UIImage(named: "person"))
    //textField.setIcon(UIImage(named: "icon-user"))
    //textField.setIcon()
    //textField.textAlignment = .center
    textField.clearButtonMode = UITextField.ViewMode.whileEditing
    textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
}

class UserFormViewController: UIViewController {
    enum SubmitError:Error {
        case fieldsCannotBeNull
    }
    var fimage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "person.badge.plus.fill")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = .systemBlue
        return view
    }()
    
    var submit: UIButton = {
        let button=UIButton(type: .system)
        button.setTitle("Add User", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(submits), for: .touchUpInside)
        //button.frame = CGRect(x: 30, y: -900, width: 100, height: 40)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var nameTextField:UITextField = {
        let textField = UITextField()
        setUpTextField(textField,placeHolder: "Name")
        return textField
   }()
    var usernameTF: UITextField = {
        let textField=UITextField()
        setUpTextField(textField, placeHolder: "Username")
        return textField
    }()
    var idTF: UITextField = {
        let textField=UITextField()
        setUpTextField(textField, placeHolder: "Id")
        return textField
    }()
    var adrTF: UITextField = {
        let textField=UITextField()
        setUpTextField(textField, placeHolder: "Address")
        return textField
    }()
    var phoneTF: UITextField = {
        let textField=UITextField()
        setUpTextField(textField, placeHolder: "Contact Number")
        return textField
    }()
    var websiteTF: UITextField = {
        let textField=UITextField()
        setUpTextField(textField, placeHolder: "Website")
        return textField
    }()
    var companyTF: UITextField = {
        let textField=UITextField()
        setUpTextField(textField, placeHolder: "Company")
        return textField
    }()
    
    @objc func submits()
    {
        do{
            let name = nameTextField.text
            let username = usernameTF.text
            let city = adrTF.text
            let company = companyTF.text
            let phone = phoneTF.text
            let website = websiteTF.text
            let id = Int(idTF.text!)
            
            if(id==nil || name==nil || username==nil || city==nil || website==nil || phone==nil || company==nil || name=="" || username=="" || city==""||website=="" || phone==""||company=="")
            {
                throw SubmitError.fieldsCannotBeNull
            }
            
            let cityinfo=cityInfo(city:city!)
            let companyname=companyName(name: company!)
            let user=userInfo(id: id!, name: name!, username: username!, address: cityinfo, phone: phone!, website: website!, company: companyname)
            userList.listOfUsers?.insert(user, at: userList.listOfUsers?.endIndex ?? 0)
            //isUpdated = 1
            let notif = Notification.Name(rawValue: isUpdated)
            nameTextField.text=""
            adrTF.text=""
            phoneTF.text=""
            companyTF.text=""
            websiteTF.text=""
            usernameTF.text=""
            idTF.text=""
            NotificationCenter.default.post(name: notif, object: nil)
        }
        catch {
            let alert = UIAlertController(title: "Fill the formly correctly", message: "Not all the fields are correctly filled", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
//    var nameLabel : UILabel = {
//        var name = UILabel()
//        setUpLabel(name)
//        name.text = "Name: "
//        return name
//    }()
//    var userLabel: UILabel = {
//        var username = UILabel()
//        setUpLabel(username)
//        username.text = "Username: "
//        return username
//    }()
//    var idLabel:UILabel = {
//        var id = UILabel()
//        setUpLabel(id)
//        id.text = "Id"
//        return id
//    }()
//    var address: UILabel = {
//        var adr = UILabel()
//        setUpLabel(adr)
//        adr.text = "Address: "
//        return adr
//    }()
//    var phone: UILabel = {
//       var ph = UILabel()
//        setUpLabel(ph)
//        ph.text = "Phone Number: "
//        return ph
//    }()
//    var website: UILabel = {
//        var ws = UILabel()
//        setUpLabel(ws)
//        ws.text = "Website: "
//        return ws
//    }()
//    var company: UILabel = {
//        var cmp = UILabel()
//        setUpLabel(cmp)
//        cmp.text = "Company: "
//        return cmp
//    }()
    fileprivate func setUpLabels()
    {
        fimage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        fimage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        fimage.widthAnchor.constraint(equalToConstant: 175).isActive = true
        fimage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        idTF.topAnchor.constraint(equalTo: fimage.bottomAnchor, constant: 20).isActive = true
        idTF.heightAnchor.constraint(equalToConstant: 45).isActive = true
        idTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        idTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        nameTextField.topAnchor.constraint(equalTo: idTF.bottomAnchor, constant: 15).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        usernameTF.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15).isActive = true
        usernameTF.heightAnchor.constraint(equalToConstant: 45).isActive = true
        usernameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        usernameTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        adrTF.topAnchor.constraint(equalTo: usernameTF.bottomAnchor, constant: 15).isActive = true
        adrTF.heightAnchor.constraint(equalToConstant: 45).isActive = true
        adrTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        adrTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        phoneTF.topAnchor.constraint(equalTo: adrTF.bottomAnchor, constant: 15).isActive = true
        phoneTF.heightAnchor.constraint(equalToConstant: 45).isActive = true
        phoneTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        phoneTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        websiteTF.topAnchor.constraint(equalTo: phoneTF.bottomAnchor, constant: 15).isActive = true
        websiteTF.heightAnchor.constraint(equalToConstant: 45).isActive = true
        websiteTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        websiteTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        companyTF.topAnchor.constraint(equalTo: websiteTF.bottomAnchor, constant: 15).isActive = true
        companyTF.heightAnchor.constraint(equalToConstant: 45).isActive = true
        companyTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        companyTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        submit.topAnchor.constraint(equalTo: companyTF.bottomAnchor, constant: 25).isActive = true
        submit.heightAnchor.constraint(equalToConstant: 45).isActive = true
        submit.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        submit.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title="Add User"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        //navigationController?.navigationBar.prefersLargeTitles = true
        navigationController!.navigationBar.barStyle = .default
        navigationController!.navigationBar.isTranslucent = true
        view.backgroundColor = .white
//        view.addSubview(idLabel)
//        view.addSubview(nameLabel)
//        view.addSubview(userLabel)
//        view.addSubview(address)
//        view.addSubview(phone)
//        view.addSubview(website)
//        view.addSubview(company)
        view.addSubview(nameTextField)
        view.addSubview(usernameTF)
        view.addSubview(idTF)
        view.addSubview(adrTF)
        view.addSubview(phoneTF)
        view.addSubview(websiteTF)
        view.addSubview(companyTF)
        view.addSubview(fimage)
        view.addSubview(submit)
        setUpLabels()
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
