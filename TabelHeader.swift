//
//  TabelHeader.swift
//  SkyCatchTest
//
//  Created by digvijay mallegowda on 10/2/17.
//  Copyright © 2017 InfinityDeveloperZone. All rights reserved.
//

import UIKit


//custom design of cell



class TabelHeader: UITableViewHeaderFooterView {
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: "headerID")
        setupviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let lable1 : UILabel = {
        let set = UILabel()
        set.translatesAutoresizingMaskIntoConstraints = false
        set.textColor = .black
        set.text = "Movie Name"
        set.font = UIFont.boldSystemFont(ofSize: 15)
        return set
    }()
    let lable2 : UILabel = {
        let set = UILabel()
        set.translatesAutoresizingMaskIntoConstraints = false
        set.textColor = .black
        set.textAlignment = .center
        set.font = UIFont.boldSystemFont(ofSize: 15)
        set.text = "Location"
        return set
    }()
    let lable3 : UILabel = {
        let set = UILabel()
        set.translatesAutoresizingMaskIntoConstraints = false
        set.textColor = .black
        set.font = UIFont.boldSystemFont(ofSize: 15)
        set.text = "Year"
        return set
    }()
    let line : UIView = {
        let set = UIView()
        set.translatesAutoresizingMaskIntoConstraints = false
        set.backgroundColor = UIColor.black
        set.alpha = 0.1
        return set
    }()
    
    
    func setupviews(){
        self.addSubview(lable1)
        self.addSubview(line)
        self.addSubview(lable2)
        self.addSubview(lable3)
        
        lable1.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        lable1.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        lable1.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        
        lable2.leadingAnchor.constraint(equalTo: lable1.trailingAnchor, constant: 20).isActive = true
        lable2.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        lable2.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        lable2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        line.leftAnchor.constraint(equalTo: lable1.leftAnchor).isActive = true
        line.topAnchor.constraint(equalTo: lable1.bottomAnchor, constant: 4).isActive = true
        line.rightAnchor.constraint(equalTo: lable1.rightAnchor).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        lable3.leftAnchor.constraint(equalTo: lable1.leftAnchor).isActive = true
        lable3.topAnchor.constraint(equalTo: lable1.bottomAnchor, constant: 8).isActive = true
        lable3.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
}





