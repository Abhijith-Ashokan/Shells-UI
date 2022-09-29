//
//  tableViewCellTableViewCell.swift
//  Shells UI
//
//  Created by Abhijith on 08/09/22.
//

import UIKit

class feedsTableViewCell: UITableViewCell {
    
    let layout = UICollectionViewLayout()
    @IBOutlet var feedLabel: UILabel!
    @IBOutlet var feedButton: UIButton!
    var feeds : Feeds? = nil{
        didSet{
            feedsCollectionView.reloadData()
        }
    }
   
    @IBOutlet var feedsCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        feedsCollectionView.dataSource = self
        feedsCollectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension feedsTableViewCell : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //for dynamic  cell size
        
        return CGSize(width: 108, height: 176)
    }
}
//titles collectionview delegate methods
extension feedsTableViewCell : UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return (feeds?.FeedItems.count) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "titlesCell", for: indexPath) as? titlesCollectionViewCell else{
            return UICollectionViewCell()
        }
        if let data = feeds?.FeedItems[indexPath.row]{
            cell.titlesLabel.text = data.Description
            cell.titlesProgressView.progress = data.Progress
            cell.showNameLabel.text = data.TitleName
        }
        return cell
    }
}

