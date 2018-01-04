//
//  TableViewController.swift
//  CollectionViewInTableCell
//
//  Created by nguyencuong on 12/29/17.
//  Copyright © 2017 nguyencuong. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.share.dataLibrary.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! TableViewCell
        
        cell.headerCollectionView.text = DataService.share.dataLibrary[indexPath.row].titleHeader
        cell.imageHeader.image = DataService.share.dataLibrary[indexPath.row].iconHeader
        
       return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? TableViewCell else { return }
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let heightCell = view.frame.height / 2
        return heightCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DataService.share.selectedHead = indexPath.row
    }
    

}
extension TableViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    //MARK: WidthCell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemsPerRow: CGFloat = 3
        
        let paddingSpace = DataService.share.sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
    
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return DataService.share.sectionInsets
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return DataService.share.sectionInsets.left
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataService.share.dataLibrary[collectionView.tag].listImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReusableCell", for: indexPath) as! CollectionViewCell
        
        switch collectionView.tag {
        case 0:
            cell.imageIcon.image = DataService.share.dataLibrary[collectionView.tag].listImage[indexPath.row]
        case 1:
            cell.imageIcon.image = DataService.share.dataLibrary[collectionView.tag].listImage[indexPath.row]
        case 2:
            cell.imageIcon.image = DataService.share.dataLibrary[collectionView.tag].listImage[indexPath.row]
        case 3:
            cell.imageIcon.image = DataService.share.dataLibrary[collectionView.tag].listImage[indexPath.row]
        default:
            cell.imageIcon.image = UIImage(named: "default")
        }
        return cell
    }
    
}
