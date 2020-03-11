//
//  ViewController.swift
//  vc
//
//  Created by Dhruvik Chevli on 26/01/20.
//  Copyright © 2020 Dhruvik Chevli. All rights reserved.
//

import UIKit

struct CustomData {
    var title : String
    var image : UIImage
    var url : String
}

class CustomCell: UICollectionViewCell {
    
    var data: CustomData? {
        didSet {
            guard let data = data else { return }
            bg.image = data.image
        }
    }
    
    fileprivate let bg: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        //iv.image = #imageLiteral(resourceName: "image2")
        //iv.backgroundColor = .red
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    fileprivate func setupImageView() {
        addSubview(bg)
        
        bg.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupImageView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let data = [
        CustomData(title: "image1", image: #imageLiteral(resourceName: "image2"), url:"/image1"),
        CustomData(title: "image2", image: #imageLiteral(resourceName: "image1"), url:"/image2"),
        CustomData(title: "image3", image: #imageLiteral(resourceName: "image3"), url:"/image3"),
        CustomData(title:"image4", image: #imageLiteral(resourceName: "image2"), url:"/image4")
        
    ]
    
    fileprivate lazy var collectionView: UICollectionView = {
        let layout=UICollectionViewFlowLayout()
        //layout.scrollDirection = .horizontal
        let cv=UICollectionView(frame: .zero, collectionViewLayout:layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()

    fileprivate func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
//        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive=true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // you can add dark mode support by using UIColor(named: "") and adding colours in assets like I have added one as an example
        // you will get a prompt which adds an if #available statement which allows you to add different code for iOS 13 devices
        // and devices below iOS 13
        //UIColor(named: "Dark appearance")
        // try it out
        setupCollectionView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:  UICollectionViewLayout, sizeForItemAt indexPath: IndexPath ) -> CGSize {
        return CGSize(width : 100, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView,numberOfItemsInSection section: Int) -> Int{
        return data.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)-> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
//        cell.backgroundColor = .red
        cell.data = self.data[indexPath.row]
        return cell
    }
        
}
