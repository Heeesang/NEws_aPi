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
    let user: [User] = [User(profile: UIImage(named: "형록")!, name: "김형록"),
                        User(profile: UIImage(named: "형록")!, name: "김형록")]
    
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
        table.register(CustomCell.self, forCellReuseIdentifier: CustomCell.cellId)
        table.delegate = self
        table.dataSource = self
        table.rowHeight = 100
    }
    
}

extension MainVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: CustomCell.cellId, for: indexPath) as! CustomCell
        
        cell.profile.image = user[indexPath.row].profile
        cell.name.text = user[indexPath.row].name
        
        return cell
    }
}
