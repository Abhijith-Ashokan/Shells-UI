//
//  ViewController.swift
//  Shells UI
//
//  Created by Abhijith on 06/09/22.
//

import UIKit

class ViewController:
    
    UIViewController,UICollectionViewDelegate,UICollectionViewDataSource  {
    
    @IBOutlet var hubsCollectionView: UICollectionView!
    @IBOutlet var feedsAndTitlesTableView: UITableView!
    var jsonData : [Hubs]? = nil
    var noOfFeedsInHub : Int? = 0
    var feedsData : [Feeds]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        hubsCollectionView.dataSource=self
        hubsCollectionView.delegate=self
        //self.hubsCollectionView.collectionViewLayout=UICollectionViewLayout()
        feedsAndTitlesTableView.dataSource = self
        feedsAndTitlesTableView.delegate = self
        parseJSON()
        self.feedsData = self.jsonData?[0].HubData
        
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
    
    
    private func setNavigationBarImage(){
        let logo = UIImage(named: "Logo")
        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleAspectFill
        self.navigationItem.titleView = imageView
        
    }
    private func setupView(){
        setNavigationBarImage()
    }
    
    //feeds collection view delegate methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // print("testdata\(jsonData!.count)")
        return jsonData!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HubsCollectonViewCollectionViewCell
        cell.hubs.text = jsonData![indexPath.row].HubName
        print(jsonData![indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected hubscollectionview cell at indexpath:\(indexPath.row)")
        self.feedsData = self.jsonData?[indexPath.row].HubData
        //noOfFeedsInHub = feedsData?.count
        //print("testdata:\(noOfFeedsInHub)")
        feedsAndTitlesTableView.reloadData()
        
    }
//    func getFeedsData () ->[Feeds]?{
//       
//        if self.feedsData != nil{
//            return self.feedsData
//        }
//        else{
//            return self.jsonData?[0].HubData
//        }
//        
//    }
}
//feeds tableview delegate methods
    extension ViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.feedsData != nil{
            return (self.feedsData?.count)!
        }
        else{
            return (jsonData?[0].HubData.count)!
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellfeeds", for: indexPath) as! tableViewCellTableViewCell
        print("IndexPath:\(indexPath.row)")
        print("feedsData:\(feedsData)")
        if self.feedsData != nil{
            cell.feeds = self.feedsData?[indexPath.row]
            cell.feedLabel.text = feedsData?[indexPath.row].FeedName
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}

extension ViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }
}
