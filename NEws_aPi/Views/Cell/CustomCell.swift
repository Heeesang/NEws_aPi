import UIKit
import SnapKit
import Then

class CustomCell: UITableViewCell{
        
    static let cellId = "CellId"
    
    private let urlToImage = UIImageView()
    private let name = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        self.addSubview(urlToImage)
        self.addSubview(name)
        
        urlToImage.snp.makeConstraints{
            $0.width.equalTo(60)
            $0.height.equalTo(60)
            $0.leading.equalTo(self.leadingAnchor as! ConstraintRelatableTarget)
            $0.center.equalTo(self.centerYAnchor as! ConstraintRelatableTarget)
        }
        
        name.snp.makeConstraints{
            $0.leading.equalTo(urlToImage)
            $0.center.equalTo(self.centerYAnchor as! ConstraintRelatableTarget)
        }
        
    }
    
    
}
