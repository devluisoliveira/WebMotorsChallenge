//
//  ListCarCell.swift
//  ListOfCars
//
//  Created by Luis Eduardo Silva Oliveira on 09/02/22.
//

import UIKit

class ListCarCell: UICollectionViewCell {
    //MARK: - Properties
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        return view
    }()
    
    lazy var carImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 8
        iv.image = UIImage(named: "notimage")
        return iv
    }()
    
    lazy var makeCarLabel: UILabel = {
        let label = UILabel()
        label.text = "TOYOTA "
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    }()
    
    lazy var modelCarLabel: UILabel = {
        let label = UILabel()
        label.text = "COROLLA"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    }()
    
    lazy var versionCarLabel: UILabel = {
        let label = UILabel()
        label.text = "2.0 XEI 16V FLEX 4P AUTOMÁTICO"
        label.textColor = .systemGray
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    }()
    
    lazy var priceCarLabel: UILabel = {
        let label = UILabel()
        label.text = "RS 75.000,00"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 1
        return label
    }()
    
    lazy var yearsFabCarLabel: UILabel = {
        let label = UILabel()
        label.text = "2016"
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    }()
    
    lazy var yearsDividerCarLabel: UILabel = {
        let label = UILabel()
        label.text = "/"
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    }()
    
    lazy var yearsModelCarLabel: UILabel = {
        let label = UILabel()
        label.text = "2017"
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    }()
    
    lazy var heartButton: UIButton = {
        let button = UIButton(type: .system)
        let systemImage = UIImage(systemName: "heart")
        button.setImage(systemImage, for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(handleLike), for: .touchUpInside)
        return button
    }()
    
    lazy var kmCarLabel: UILabel = {
        let label = UILabel()
        label.text = "15000 km"
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    }()
    
    var flag: Bool = false
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        addSubview(containerView)
        containerView.addSubview(carImageView)
        containerView.addSubview(makeCarLabel)
        containerView.addSubview(modelCarLabel)
        containerView.addSubview(versionCarLabel)
        containerView.addSubview(priceCarLabel)
        containerView.addSubview(yearsFabCarLabel)
        containerView.addSubview(yearsDividerCarLabel)
        containerView.addSubview(yearsModelCarLabel)
        containerView.addSubview(heartButton)
        containerView.addSubview(kmCarLabel)
        
        containerView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5)
        carImageView.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, right: containerView.rightAnchor, paddingTop: 4, paddingLeft: 4, paddingBottom: 4, paddingRight: 4, height: 250)
        makeCarLabel.anchor(top: carImageView.bottomAnchor, left: containerView.leftAnchor, paddingTop: 10, paddingLeft: 10)
        modelCarLabel.anchor(top: carImageView.bottomAnchor, left: makeCarLabel.rightAnchor, paddingTop: 10, paddingLeft: 3)
        versionCarLabel.anchor(top: modelCarLabel.bottomAnchor, left: containerView.leftAnchor, right: containerView.rightAnchor, paddingTop: 2, paddingLeft: 10, paddingRight: 10)
        priceCarLabel.anchor(top: versionCarLabel.bottomAnchor, left: containerView.leftAnchor, right: containerView.rightAnchor, paddingTop: 20, paddingLeft: 10, paddingRight: 10)
        yearsFabCarLabel.anchor(left: containerView.leftAnchor, bottom: containerView.bottomAnchor, paddingLeft: 10, paddingBottom: 10)
        yearsDividerCarLabel.anchor(left: yearsFabCarLabel.rightAnchor, bottom: containerView.bottomAnchor, paddingLeft: 1, paddingBottom: 10)
        yearsModelCarLabel.anchor(left: yearsDividerCarLabel.rightAnchor, bottom: containerView.bottomAnchor, paddingLeft: 1, paddingBottom: 10)
        heartButton.anchor(top: carImageView.bottomAnchor, right: containerView.rightAnchor, paddingTop: 10, paddingRight: 10, widht: 20, height: 20)
        kmCarLabel.anchor(bottom: containerView.bottomAnchor, right: containerView.rightAnchor, paddingBottom: 10 ,paddingRight: 10)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Selectors
    @objc func handleLike() {
        var systemImage = UIImage()
        flag.toggle()
        if flag {
            systemImage = UIImage(systemName: "heart.fill")!
        } else {
            systemImage = UIImage(systemName: "heart")!
        }
        heartButton.setImage(systemImage, for: .normal)
    }
}
