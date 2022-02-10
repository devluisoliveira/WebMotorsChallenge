//
//  DetailsCarViewController.swift
//  ListOfCars
//
//  Created by Luis Eduardo Silva Oliveira on 10/02/22.
//

import UIKit
import Kingfisher

class DetailsCarViewController: UIViewController {
    //MARK: - Properties
    var carImage: String = ""
    var priceCar: String = ""
    var makecar: String = ""
    var modelCar: String = ""
    var versionCar: String = ""
    var yearFab: Int = 1
    var yearModel: Int = 1
    var kmCar: Int = 1
    var colorCar: String = ""
    
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
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    }()
    
    lazy var yearsDividerCarLabel: UILabel = {
        let label = UILabel()
        label.text = "/"
        label.textColor = .systemGray
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    }()
    
    lazy var yearsModelCarLabel: UILabel = {
        let label = UILabel()
        label.text = "2017"
        label.textColor = .systemGray
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    }()
    
    lazy var colorCarLabel: UILabel = {
        let label = UILabel()
        label.text = "COR: AZUL"
        label.textColor = .systemGray
        label.font = UIFont.boldSystemFont(ofSize: 14)
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
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    }()
    
    lazy var carDetailImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 8
        iv.image = UIImage(named: "notimage")
        return iv
    }()
    
    var flag: Bool = false
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isHidden = false
        navigationController?.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isHidden = false
        navigationController?.tabBarController?.tabBar.isHidden = false
    }
    
    //MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .black
        title = "Detalhes do carro"
        
        view.addSubview(containerView)
        containerView.addSubview(carImageView)
        containerView.addSubview(makeCarLabel)
        containerView.addSubview(modelCarLabel)
        containerView.addSubview(versionCarLabel)
        containerView.addSubview(priceCarLabel)
        containerView.addSubview(yearsFabCarLabel)
        containerView.addSubview(yearsDividerCarLabel)
        containerView.addSubview(yearsModelCarLabel)
        containerView.addSubview(colorCarLabel)
        containerView.addSubview(heartButton)
        containerView.addSubview(kmCarLabel)
        containerView.addSubview(carDetailImageView)
        
        configureConstraints()
        fillObjects()
    }
    
    func configureConstraints() {
        containerView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5)
        carImageView.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, right: containerView.rightAnchor, height: 250)
        makeCarLabel.anchor(top: carImageView.bottomAnchor, left: containerView.leftAnchor, paddingTop: 10, paddingLeft: 10)
        modelCarLabel.anchor(top: carImageView.bottomAnchor, left: makeCarLabel.rightAnchor, paddingTop: 10, paddingLeft: 3)
        versionCarLabel.anchor(top: modelCarLabel.bottomAnchor, left: containerView.leftAnchor, right: containerView.rightAnchor, paddingTop: 2, paddingLeft: 10, paddingRight: 10)
        priceCarLabel.anchor(top: versionCarLabel.bottomAnchor, left: containerView.leftAnchor, right: containerView.rightAnchor, paddingTop: 20, paddingLeft: 10, paddingRight: 10)
        yearsFabCarLabel.anchor(top: priceCarLabel.bottomAnchor ,left: containerView.leftAnchor, paddingTop: 20, paddingLeft: 10)
        yearsDividerCarLabel.anchor(top: priceCarLabel.bottomAnchor, left: yearsFabCarLabel.rightAnchor,paddingTop: 20, paddingLeft: 1)
        yearsModelCarLabel.anchor(top: priceCarLabel.bottomAnchor, left: yearsDividerCarLabel.rightAnchor, paddingTop: 20, paddingLeft: 1)
        colorCarLabel.centerX(inView: containerView, topAnchor: yearsModelCarLabel.topAnchor)
        heartButton.anchor(top: carImageView.bottomAnchor, right: containerView.rightAnchor, paddingTop: 10, paddingRight: 10, widht: 20, height: 20)
        kmCarLabel.anchor(top: yearsModelCarLabel.topAnchor, right: containerView.rightAnchor,paddingRight: 10)
        carDetailImageView.anchor(top: yearsFabCarLabel.bottomAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, paddingTop: 15, paddingLeft: 15, paddingBottom: 15, paddingRight: 15)
    }
    
    func fillObjects() {
        let urlFull = carImage
        let fullUrlArray = urlFull.components(separatedBy: "//")
        let url = fullUrlArray[1]
        
        if let urlPoster = URL(string: "https://\(url)") {
            carImageView.kf.setImage(with: urlPoster)
            carDetailImageView.kf.setImage(with: urlPoster)
        } else {
            carImageView.image = UIImage(named: "notimage")
            carDetailImageView.image = UIImage(named: "notimage")
        }
        
        makeCarLabel.text = makecar.uppercased()
        modelCarLabel.text = modelCar.uppercased()
        versionCarLabel.text = versionCar.uppercased()
        priceCarLabel.text = priceCar.currencyInputFormatting()
        yearsFabCarLabel.text = yearFab.description.uppercased()
        yearsModelCarLabel.text = yearModel.description.uppercased()
        kmCarLabel.text = "\(kmCar.description.uppercased()) km"
        colorCarLabel.text = "COR: \(colorCar.uppercased())"
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
