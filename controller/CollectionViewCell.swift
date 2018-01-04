//
//  CollectionViewCell.swift
//  CollectionViewInTableCell
//
//  Created by nguyencuong on 12/29/17.
//  Copyright © 2017 nguyencuong. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageIcon: UIImageView!{
        didSet{
            imageIcon.layer.cornerRadius = 5.0
            imageIcon.layer.borderWidth = 1
            imageIcon.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
    override func prepareForReuse() {
        
    }
}
