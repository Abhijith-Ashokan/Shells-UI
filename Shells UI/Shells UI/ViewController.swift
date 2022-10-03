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
    var feedsData : [Feeds]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        hubsCollectionView.dataSource=self
        hubsCollectionView.delegate=self
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
        return jsonData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HubsCollectionViewCell
        cell.hubs.text = jsonData![indexPath.row].HubName
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected hubscollectionview cell at indexpath:\(indexPath.row)")
        self.feedsData = self.jsonData?[indexPath.row].HubData
        feedsAndTitlesTableView.reloadData()
    }
}

//feeds tableview datasource & delegate methods
    extension ViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.feedsData?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellfeeds", for: indexPath) as! feedsTableViewCell
        if self.feedsData != nil{
            cell.feeds = self.feedsData?[indexPath.row]
            cell.feedLabel.text = feedsData?[indexPath.row].FeedName
        }
        return cell
    }
        
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
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
