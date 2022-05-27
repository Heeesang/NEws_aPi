//
//  ArticleModel.swift
//  NEws_aPi
//
//  Created by 곽희상 on 2022/05/19.
//

import Foundation

struct articleResponse: Codable{

    let articles: Articles
    
    struct Articles: Codable {
        let title: String
        let description: String
        let url: String
        let urlToImage: String
    }
}



struct newsListRequest {
    struct newsParam{
        var q: String
        var form: String
        var sortBy: String
        var apikey: String
    }
}
