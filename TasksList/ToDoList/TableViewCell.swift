//
//  TableViewCell.swift
//  ToDoList
//
//  Created by Dhruvik Chevli on 24/02/20.
//  Copyright © 2020 Dhruvik Chevli. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    var etask: UILabel = {
        let task1 = UILabel()
        task1.numberOfLines=1
        task1.adjustsFontSizeToFitWidth = true
        task1.translatesAutoresizingMaskIntoConstraints = false
        task1.font = UIFont(name: "AppleSDGothicNeo-Medium",size: 30)
        return task1
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(etask)
        setLabelConstraints()
        
    }
    func setLabelConstraints(){
        etask.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        etask.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
    }
    func set(res: eachTask)
    {
        etask.text = String(res.task)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
