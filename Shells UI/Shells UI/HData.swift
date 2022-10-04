//
//  HData.swift
//  Shells UI
//
//  Created by Abhijith on 27/09/22.
//

import Foundation


struct Feeds : Codable {
    let FeedName : String
    let FeedItems : [titles]
    let cellSize : CellSize
}
struct CellSize : Codable{
    let width : Int
    let height : Int
}
