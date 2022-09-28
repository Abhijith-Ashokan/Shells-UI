//
//  tableViewCellTableViewCell.swift
//  Shells UI
//
//  Created by Abhijith on 08/09/22.
//

import UIKit

class tableViewCellTableViewCell: UITableViewCell {
    
    
    let layout = UICollectionViewLayout()
    @IBOutlet var feedLabel: UILabel!
    @IBOutlet var feedButton: UIButton!
    var jsonData : [Hubs]? = nil
    var numberofFeeds : Int = 0
    var feedsData : [HData]? = nil
    var titlesData : [titles]? = nil
   
    @IBOutlet var feedsCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        feedsCollectionView.dataSource = self
        feedsCollectionView.delegate = self
        populateFeeds()
        parseJSON()
            
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func parseJSON(){

        guard let url = Bundle.main.url(forResource: "sampleJSON", withExtension: "json")else{
            return
        }
        do{
            let data = try Data(contentsOf: url)
            jsonData = try JSONDecoder().decode([Hubs].self, from: data)
            return
        }
        catch{
            print("Parse error:\(error)")
        }
    }
    
}

extension tableViewCellTableViewCell : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //for dynamic  cell size
        
        return CGSize(width: 108, height: 176)
    }
}
//titles collectionview delegate methods
extension tableViewCellTableViewCell : UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (feedsData?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "titlesCell", for: indexPath) as? titlesCollectionViewCell else{
            return UICollectionViewCell()
        }
        if let data = feedsData?[indexPath.row]{
            
            print(data)
            cell.feedsTitles = data
            self.titlesData = data.FeedItems
            cell.titlesLabel.text = titlesData?[indexPath.row].Description
            cell.titlesProgressView.progress = (titlesData?[indexPath.row].Progress)!
            cell.showNameLabel.text = titlesData?[indexPath.row].TitleName
            
        }
        return cell
       
    }

    func populateFeeds(){
        feedsCollectionView.reloadData()
    }
   
}

