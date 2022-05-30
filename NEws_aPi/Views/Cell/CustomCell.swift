import UIKit
import SnapKit
import Then
import Moya

class CustomCell: UITableViewCell{
        
    static let cellId = "CellId"
    
    let profile = UIImageView()
    let name = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        
        let provider = MoyaProvider<NewsAPI>()
        provider.request(.articles(q: "tesla", from: "2022-04-27", sortBy: "publishedAt", apiKey: "d6b2e20b479c457bb60c3b2a942803ab")){ (result) in
            switch result {
            case .success(let response):
                let result = try? response.map(articleResponse.self)
                self.name.text = result?.articles.title
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        self.addSubview(profile)
        self.addSubview(name)
        
        profile.translatesAutoresizingMaskIntoConstraints = false
        profile.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        profile.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        profile.widthAnchor.constraint(equalToConstant: 60).isActive = true
        profile.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        name.translatesAutoresizingMaskIntoConstraints = false
        name.leadingAnchor.constraint(equalTo: profile.trailingAnchor, constant: 10).isActive = true
        name.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
    }
    
    
}
