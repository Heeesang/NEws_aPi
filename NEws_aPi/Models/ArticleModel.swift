//
//  ArticleModel.swift
//  NEws_aPi
//
//  Created by 곽희상 on 2022/05/19.
//

import Foundation

struct articleResponse: Decodable{

    let articles: [articles]
    
}

struct articles: Decodable {
    let title: String
    let description: String
    let url: String
    let urlToImage: String
}
