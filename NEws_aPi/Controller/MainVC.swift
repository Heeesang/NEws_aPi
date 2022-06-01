//
//  MainVC.swift
//  NEws_aPi
//
//  Created by 곽희상 on 2022/05/17.
//

import Foundation
import UIKit
import SnapKit
import Then
import Moya

class MainVC: UIViewController
{
   
    let table = UITableView()
    let articlse: [articleResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(table)
        attribute()
        layout()
        print("da")
        
        let provider = MoyaProvider<NewsAPI>()
        provider.request(.articles(q: "tesla", from: "2022-05-01", sortBy: "publishedAt", apiKey: "d6b2e20b479c457bb60c3b2a942803ab")){ (result) in
            switch result {
            case .success(let response):
                let responseData = response.data
                do {
                    let decoded = try JSONDecoder().decode(articleResponse.self, from: responseData)
                    print(decoded)
                
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
       
    }
    
    func layout() {
        table.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
    }
    
    func attribute() {
        table.register(CustomCell.self, forCellReuseIdentifier: CustomCell.cellId)
        table.delegate = self
        table.dataSource = self
        table.rowHeight = 100
    }
    
}

extension MainVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: CustomCell.cellId, for: indexPath) as! CustomCell
        
        
        return cell
    }
}
