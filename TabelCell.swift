//
//  TableCell.swift
//  SkyCatchTest
//
//  Created by digvijay mallegowda on 10/1/17.
//  Copyright © 2017 InfinityDeveloperZone. All rights reserved.
//

import UIKit

class TabelCell:UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: "cellID")
        self.backgroundColor = UIColor.white
        setupviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
// check data and Update in Main
    func updateUI(data : Movies!)  {
        DispatchQueue.global().async {
            if let datas = data{
                DispatchQueue.main.async {
                    self.lable1.text = datas.title
                    self.lable2.text = datas.locations
                    self.lable3.text = datas.release_year
                }
            }
        }
     
      
        
    }
    
//   custom design of cell
    
    let lable1 : UILabel = {
        let set = UILabel()
        set.translatesAutoresizingMaskIntoConstraints = false
        set.textColor = .black
        set.numberOfLines = 0
        set.lineBreakMode = .byWordWrapping
        return set
    }()
    let lable2 : UILabel = {
        let set = UILabel()
        set.translatesAutoresizingMaskIntoConstraints = false
        set.textColor = .black
        set.numberOfLines = 0
        set.lineBreakMode = .byWordWrapping
        set.textAlignment = .center
        
        return set
    }()
    let lable3 : UILabel = {
        let set = UILabel()
        set.translatesAutoresizingMaskIntoConstraints = false
        set.textColor = .black
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
        self.addSubview(lable2)
        self.addSubview(lable3)
        self.addSubview(line)
        
        lable1.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        lable1.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        lable1.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        lable2.leadingAnchor.constraint(equalTo: lable1.trailingAnchor, constant: 20).isActive = true
        lable2.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        lable2.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        lable2.heightAnchor.constraint(equalToConstant: 50)
        
        line.leftAnchor.constraint(equalTo: lable1.leftAnchor).isActive = true
        line.topAnchor.constraint(equalTo: lable1.bottomAnchor, constant: 4).isActive = true
        line.rightAnchor.constraint(equalTo: lable1.rightAnchor).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        lable3.leftAnchor.constraint(equalTo: lable1.leftAnchor).isActive = true
        lable3.topAnchor.constraint(equalTo: lable1.bottomAnchor, constant: 8).isActive = true
        lable3.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }
    
}



