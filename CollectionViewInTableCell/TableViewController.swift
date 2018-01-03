//
//  TableViewController.swift
//  CollectionViewInTableCell
//
//  Created by nguyencuong on 12/29/17.
//  Copyright © 2017 nguyencuong. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var listArray: [[Int]] = [[0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9],[10,11,12,13,14,15,16,17,18,19,0,1,2,3,4,5,6,7,8,9],[20,21,22,23,24,25,26,27,28,29,0,1,2,3,4,5,6,7,8,9],[30,31,32,33,34,35,36,37,38,39,0,1,2,3,4,5,6,7,8,9]]
    var listHeader: [String] = ["Trending Pictures", "Holiday", "People", "Food"]
    var listicon: [String] = ["ic_trending@2x","ic_holiday","ic_people@2x","ic_food@2x"]

    override func viewDidLoad() {
        super.viewDidLoad()
        DataService.share.loadFilePlist()
    }
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! TableViewCell
        
        cell.headerCollectionView.text = listHeader[indexPath.row]
        cell.imageHeader.image = UIImage(named: "\(listicon[indexPath.row])")
        
        
       return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let tableViewCell = cell as? TableViewCell else { return }
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
        
    }

}
extension TableViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listArray[collectionView.tag].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReusableCell", for: indexPath) as! CollectionViewCell
        
        switch collectionView.tag {
        case 0:
            cell.imageIcon.image = UIImage(named: "default")
        case 1:
            cell.imageIcon.image = UIImage(named: "Image")
        case 2:
            cell.imageIcon.image = UIImage(named: "Image-1")
        case 3:
            cell.imageIcon.image = UIImage(named: "Image-2")
        default:
            cell.imageIcon.image = UIImage(named: "default")
        }
        
        return cell
    }
    
    
    
}
