//
//  MyCell.swift
//  ViewCode
//
//  Created by COTEMIG on 30/08/23.
//

import UIKit

class MyCell: UITableViewCell {
    
    private lazy var testeLabel : UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.font = UIFont(name: "Menlo", size: 15)
        return view
    }()
    
    private lazy var image : UIImageView = {
        let view = UIImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        self.addSubview(testeLabel)
        self.addSubview(image)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 5),
            image.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            image.widthAnchor.constraint(equalToConstant: 80),
            image.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    
    public func addImagem(_ imageUrl: String) {
        image.kf.setImage(with: URL(string: imageUrl))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
