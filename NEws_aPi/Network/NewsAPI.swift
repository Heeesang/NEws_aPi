//
//  News.swift
//  NEws_aPi
//
//  Created by 곽희상 on 2022/05/26.
//
import Moya

public enum NewsAPI {
    case articles(country: String, category: String, apiKey: String)
}

extension NewsAPI: TargetType {
    
    public var baseURL: URL{
        guard let url = URL(string: "https://newsapi.org") else {
            fatalError("base URL couldn't be configure")
        }
        
        return url
    }
    
    public var path: String {
        switch self {
        case .articles:
            return "/v2/top-headlines"
        }
    }
    
    public var method: Method {
        switch self{
        case .articles:
            return .get
        }
    }
    
    public var sampleData: Data{
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .articles(let country, let category, let apiKey):
            return .requestParameters(parameters: ["country": country, "category": category, "apiKey" : apiKey], encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        return nil
    }
    
    
   
    
}
