//
//  DataService.swift
//  CollectionViewInTableCell
//
//  Created by nguyencuong on 1/3/18.
//  Copyright © 2018 nguyencuong. All rights reserved.
//

import Foundation
class DataService{
    static let share = DataService()
    
    
    func loadFilePlist() {
        var myDict: NSDictionary?
        if let path = Bundle.main.path(forResource: "PropertyList", ofType: "plist") {
            myDict = NSDictionary(contentsOfFile: path)
        }
        if let dict = myDict {
            print(dict)
        }
    }
    
    
}
