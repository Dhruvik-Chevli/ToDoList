//
//  structUsers.swift
//  UsersAPI
//
//  Created by Dhruvik Chevli on 03/03/20.
//  Copyright © 2020 Dhruvik Chevli. All rights reserved.
//

import Foundation
struct UsersResponse:Decodable{
    var users:[userInfo]
}
struct userInfo:Decodable{
    var id:Int
    var name:String
    var username:String
    var address:cityInfo
    var phone:String
    var website:String
    var company:companyName
}
struct cityInfo:Decodable{
    var city:String
}
struct companyName:Decodable{
    var name:String
}
