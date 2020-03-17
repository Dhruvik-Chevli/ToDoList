//
//  TableViewCell.swift
//  UsersAPI
//
//  Created by Dhruvik Chevli on 10/03/20.
//  Copyright © 2020 Dhruvik Chevli. All rights reserved.
//

import UIKit
extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
fileprivate func setUpLabel(_ label: UILabel) {
    label.numberOfLines = 1
    label.adjustsFontSizeToFitWidth = true
    label.translatesAutoresizingMaskIntoConstraints = false
}

class TableViewCell: UITableViewCell {
    
    var backgroundCard: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        view.backgroundColor = UIColor(white: 0, alpha: 0.2)
        view.clipsToBounds = true
        return view
    }()

    var eusername: UILabel = {
       let username=UILabel()
        setUpLabel(username)
//        username.font = UIFont(name: "Helvetica-Bold",size:25)
        username.font = UIFont.boldSystemFont(ofSize: 25)
        return username
    }()
    var ename: UILabel = {
        let name=UILabel()
        setUpLabel(name)
//        name.font = UIFont(name: "Helvetica",size:20)
        name.font = UIFont.systemFont(ofSize: 20)
        //let color = UIColor.init(named: "#00FF00FF")
        let green = UIColor(hex:"#7f7f7fFF")
        name.textColor = green
        return name
    }()
    var locPin: UIImageView = {
        let locationPin = UIImageView()
        locationPin.translatesAutoresizingMaskIntoConstraints = false
        //locationPin.contentMode = .scaleAspectFill
        locationPin.clipsToBounds = true
        return locationPin
    }()
    var ecity:UILabel = {
        let city = UILabel()
        setUpLabel(city)
//        city.font = UIFont(name: "Helvetica",size:20)
        city.font = UIFont.systemFont(ofSize: 20)
        return city
    }()
    var enumber:UILabel = {
        let number=UILabel()
        setUpLabel(number)
//        number.font = UIFont(name:"Helvetica",size:20)
        number.font = UIFont.systemFont(ofSize: 20)
        return number
    }()
    var phoneiv: UIImageView = {
        let phoneimg = UIImageView()
        phoneimg.translatesAutoresizingMaskIntoConstraints = false
        //locationPin.contentMode = .scaleAspectFill
        phoneimg.clipsToBounds = true
        return phoneimg
    }()
    var ewebsite:UILabel = {
        let website = UILabel()
        setUpLabel(website)
//        website.font = UIFont(name:"Helvetica",size:20)
        website.font = UIFont.systemFont(ofSize: 20)
        return website
    }()
    var wsiv: UIImageView = {
        let wsimg = UIImageView()
        wsimg.translatesAutoresizingMaskIntoConstraints = false
        //locationPin.contentMode = .scaleAspectFill
        wsimg.clipsToBounds = true
        return wsimg
    }()
    var ecomp:UILabel = {
        let comp = UILabel()
        setUpLabel(comp)
//        comp.font = UIFont(name:"Helvetica",size:20)
        comp.font = UIFont.systemFont(ofSize: 20)
        comp.textColor = UIColor(hex: "#7F7F7FFF")
        return comp
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style,reuseIdentifier: reuseIdentifier)
        addSubview(backgroundCard)
        addSubview(eusername)
        addSubview(ename)
        addSubview(locPin)
        addSubview(ecity)
        addSubview(enumber)
        addSubview(phoneiv)
        addSubview(wsiv)
        addSubview(ewebsite)
        addSubview(ecomp)
        setLabelConstraints()
    }
    
    fileprivate func backgroundCardConstraints() {
        backgroundCard.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        backgroundCard.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        backgroundCard.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        backgroundCard.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
    }
    
    fileprivate func eusernameConstraints() {
        eusername.topAnchor.constraint(equalTo: backgroundCard.topAnchor, constant: 10).isActive = true
        eusername.heightAnchor.constraint(equalToConstant: 25).isActive  = true
        eusername.leadingAnchor.constraint(equalTo: backgroundCard.leadingAnchor, constant: 30).isActive = true
        eusername.widthAnchor.constraint(equalTo: widthAnchor, constant: -10).isActive = true
    }
    
    fileprivate func enameConstraints() {
        //eusername.widthAnchor.constraint(equalToConstant: 100).isActive = true
        ename.topAnchor.constraint(equalTo: eusername.bottomAnchor , constant:5).isActive = true
        ename.heightAnchor.constraint(equalToConstant: 25).isActive = true
        ename.leadingAnchor.constraint(equalTo: backgroundCard.leadingAnchor, constant: 30).isActive = true
        ename.widthAnchor.constraint(equalTo: widthAnchor, constant: -10).isActive = true
    }
    
    fileprivate func locpinConstraints() {
        locPin.topAnchor.constraint(equalTo: ename.bottomAnchor, constant: 10).isActive = true
        locPin.heightAnchor.constraint(equalToConstant: 25).isActive = true
        locPin.leadingAnchor.constraint(equalTo: backgroundCard.leadingAnchor, constant: 30).isActive = true
        locPin.widthAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    fileprivate func ecityConstraints() {
        ecity.leadingAnchor.constraint(equalTo: locPin.trailingAnchor, constant: 2).isActive = true
        //ecity.heightAnchor.constraint(equalToConstant: 25).isActive = true
        ecity.widthAnchor.constraint(lessThanOrEqualToConstant: 1000).isActive = true
        ecity.centerYAnchor.constraint(equalTo: locPin.centerYAnchor).isActive = true
    }
    
    fileprivate func phoneConstraints() {
        phoneiv.topAnchor.constraint(equalTo: locPin.bottomAnchor, constant: 10).isActive = true
        phoneiv.heightAnchor.constraint(equalToConstant: 25).isActive = true
        phoneiv.leadingAnchor.constraint(equalTo: backgroundCard.leadingAnchor, constant: 30).isActive = true
        phoneiv.widthAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    fileprivate func enumberConstraints() {
        enumber.centerYAnchor.constraint(equalTo: phoneiv.centerYAnchor).isActive = true
        enumber.leadingAnchor.constraint(equalTo: phoneiv.trailingAnchor, constant: 2).isActive = true
        enumber.trailingAnchor.constraint(equalTo: backgroundCard.trailingAnchor, constant: -10).isActive = true
    }
    
    fileprivate func wsivConstraints() {
        wsiv.topAnchor.constraint(equalTo: phoneiv.bottomAnchor, constant: 10).isActive = true
        wsiv.heightAnchor.constraint(equalToConstant: 25).isActive = true
        wsiv.leadingAnchor.constraint(equalTo: backgroundCard.leadingAnchor, constant: 30).isActive = true
        wsiv.widthAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    fileprivate func ewebsiteConstraints() {
        //ewebsite.topAnchor.constraint(equalTo: locPin.bottomAnchor, constant: 10).isActive = true
        //ewebsite.heightAnchor.constraint(equalToConstant: 25).isActive = true
        ewebsite.centerYAnchor.constraint(equalTo: wsiv.centerYAnchor).isActive = true
        ewebsite.leadingAnchor.constraint(equalTo: wsiv.trailingAnchor, constant: 2).isActive = true
        ewebsite.trailingAnchor.constraint(equalTo: backgroundCard.trailingAnchor, constant: -10).isActive = true
    }
    
    fileprivate func ecompConstraints() {
        ecomp.topAnchor.constraint(equalTo: wsiv.bottomAnchor, constant: 10).isActive = true
        ecomp.heightAnchor.constraint(equalToConstant: 25).isActive = true
        ecomp.leadingAnchor.constraint(equalTo: backgroundCard.leadingAnchor, constant: 30).isActive = true
        ecomp.trailingAnchor.constraint(equalTo: backgroundCard.trailingAnchor, constant: -10).isActive = true
    }
    
    func setLabelConstraints() {
        
        backgroundCardConstraints()
        
        eusernameConstraints()
        
        enameConstraints()
        
        locpinConstraints()
        
        ecityConstraints()
        
        phoneConstraints()
        
        enumberConstraints()
        
        wsivConstraints()
        
        ewebsiteConstraints()
        
        ecompConstraints()
    }
    
    func set(res:userInfo) {
        eusername.text = String(res.username)
        ename.text = String(res.name)
        locPin.image = UIImage(systemName: "mappin")
        locPin.tintColor = .black
        ecity.text = String(res.address.city)
        phoneiv.image = UIImage(systemName: "phone.fill")
        enumber.text = String(res.phone)
        wsiv.image = UIImage(systemName: "globe")
        ewebsite.text = String(res.website)
        ecomp.text = String(res.company.name)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
