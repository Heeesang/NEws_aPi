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

class MainVC: UIViewController
{
   
    let table = UITableView()
    let testarr = ["a","b","c"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(table)
        attribute()
        layout()
        
    }
    
    func layout() {
        table.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
    }
    
    func attribute() {
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
    }
    
}

extension MainVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testarr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = testarr[indexPath.row]
        
        return cell
    }
}
