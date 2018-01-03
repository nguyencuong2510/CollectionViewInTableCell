//
//  LibraryModel.swift
//  CollectionViewInTableCell
//
//  Created by nguyencuong on 1/3/18.
//  Copyright © 2018 nguyencuong. All rights reserved.
//

import Foundation
import UIKit
typealias JSON = Dictionary<String, Any>

class LibraryModel {
    var imageIcon: UIImage = UIImage(named: "default")!
    var txtHeader: String = ""
    var listImage: [UIImage] = []
    
    init?(dict: JSON) {
        guard let imageIcon = dict["imageIcon"] as? [String],
        
        as?  else { return nil }
    }
    
}
