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

class DataLibrary {
    var iconHeader: UIImage? = UIImage(named: "default")!
    var titleHeader: String = ""
    var listImage: [UIImage?] = []
    
    init?(dict: JSON) {
        guard let iconHeader = dict["iconHeader"] as? String,
            let titleHeader = dict["titleHeader"] as? String,
            let listImage = dict["listImage"] as? [String]
        else { return nil }
        self.iconHeader = UIImage(named: iconHeader)
        self.titleHeader = titleHeader
        for image in listImage {
            self.listImage.append(UIImage(named: image))
        }
    }
    
}
