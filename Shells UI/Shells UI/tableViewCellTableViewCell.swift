//
//  tableViewCellTableViewCell.swift
//  Shells UI
//
//  Created by Abhijith on 08/09/22.
//

import UIKit

class tableViewCellTableViewCell: UITableViewCell {

    var feedTitles : [movieTitles] = []
    let layout = UICollectionViewLayout()
    @IBOutlet var feedLabel: UILabel!
    @IBOutlet var feedButton: UIButton!
    
    @IBOutlet var feedsCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        feedsCollectionView.dataSource = self
        feedsCollectionView.delegate = self
        populateFeeds()
        
    
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension tableViewCellTableViewCell : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 250)
    }
}

extension tableViewCellTableViewCell : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        feedTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "titlesCell", for: indexPath) as? titlesCollectionViewCell else{
            return UICollectionViewCell()
        }
        cell.titlesImageView.image = feedTitles[indexPath.row].titleImage
        cell.titlesProgressView.progress = feedTitles[indexPath.row].progress
        cell.titlesLabel.text = feedTitles[indexPath.row].titleLabel
        return cell
    }
   
    
    
    func populateFeeds(){
        feedTitles.append(movieTitles(titleImage:UIImage(named: "titleArt")!, progress: 0.0, titleLabel:"title0"))
        feedTitles.append(movieTitles(titleImage:UIImage(named: "titleArt")!, progress: 0.5, titleLabel:"title1"))
        feedTitles.append(movieTitles(titleImage:UIImage(named: "titleArt")!, progress: 0.8, titleLabel:"title2"))
        feedTitles.append(movieTitles(titleImage:UIImage(named: "titleArt")!, progress: 0.9, titleLabel:"title3"))
        feedTitles.append(movieTitles(titleImage:UIImage(named: "titleArt")!, progress: 0.2, titleLabel:"title4"))
        
    }
   
}

