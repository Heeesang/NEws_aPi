//
//  ArticleModel.swift
//  NEws_aPi
//
//  Created by 곽희상 on 2022/05/19.
//

import Foundation

struct articleResponse: Codable{

    let articles: [Articles]
    
    private enum CodingKeys: String, CodingKey{
        case articles
        
    }

}

struct Articles: Codable {
    var id = UUID()
    var title: String
//    var description: String
//    var urlToImage: String
    private enum CodingKeys: String, CodingKey{
        case title = "title"
//        case description = "description"
//        case urlToImage = "urlToImage"
    }
}



//struct newsListRequest {
//    struct newsParam{
//        var q: String
//        var form: String
//        var sortBy: String
//        var apikey: String
//    }
//}
