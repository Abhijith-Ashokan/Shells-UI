//
//  ViewController.swift
//  Shells UI
//
//  Created by Abhijith on 06/09/22.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource  {
   
    @IBOutlet var hubsCollectionView: UICollectionView!
    @IBOutlet var feedsAndTitlesTableView: UITableView!
    var hubsTitles :[String] = ["You","Live TV","On Demand", "Test Bug"]
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        hubsCollectionView.dataSource=self
        hubsCollectionView.delegate=self
        //self.hubsCollectionView.collectionViewLayout=UICollectionViewLayout()
        feedsAndTitlesTableView.dataSource = self
        feedsAndTitlesTableView.delegate = self
        
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

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hubsTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HubsCollectonViewCollectionViewCell
        cell.hubs.text = hubsTitles[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected collectionview cell at indexpath:\(indexPath.row)")
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellfeeds", for: indexPath)
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
