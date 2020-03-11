//
//  userRequest.swift
//  UsersAPI
//
//  Created by Dhruvik Chevli on 03/03/20.
//  Copyright © 2020 Dhruvik Chevli. All rights reserved.
//

import Foundation
enum UserError:Error{
    case noDataAvailable
    case canNotProcessData
}
struct userRequest{
    let resourceURL:URL
    //let users:[userInfo]
    init() {
        let resourceString="https://jsonplaceholder.typicode.com/users"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        self.resourceURL=resourceURL
    }
    
    
    func getUsers(completion: @escaping(Result<[userInfo],UserError>)->Void){
        let dataTask=URLSession.shared.dataTask(with:resourceURL){data,_, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do{
                let decoder=JSONDecoder()
                let usersResponse = try decoder.decode([userInfo].self, from:jsonData)
                completion(.success(usersResponse))
                //print(usersResponse)
            }
            catch{
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
        
    }
    
    
    
    
    
}
