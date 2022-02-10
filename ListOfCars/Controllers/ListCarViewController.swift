//
//  ListCarViewController.swift
//  ListOfCars
//
//  Created by Luis Eduardo Silva Oliveira on 09/02/22.
//

import UIKit
import Kingfisher

private let reuseIdentifier = "ListCarCell"

class ListCarViewController: UICollectionViewController {
    //MARK: - Properties
    var makesInfo: [Make] = []
    var modelInfo: [Model] = []
    var versionsInfo: [VersionCar] = []
    var vehiclesInfo: [Vehicle] = []
    var loadingMovies = false
    var currentPage: Int = 1
    var makeId: Int = 1
    var modelId: Int = 1
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchMakes()
        fetchModels()
        fetchVersions()
        fetchVehicles()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .black
        self.collectionView.reloadData()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.barStyle = .black
    }
    
    //MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .white
        collectionView.register(ListCarCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.backgroundColor = .black
        title = "Lista de Carros"
    }
    
    //MARK: - API
    func fetchMakes() {
        Service.shared.fetchMake { makes in
            if let makes = makes {
                self.makesInfo.append(contentsOf: makes)
            }
        }
    }
    
    func fetchModels() {
        Service.shared.fetchModel(makeId: makeId) { models in
            if let models = models {
                self.modelInfo.append(contentsOf: models)
            }
        }
    }
    
    func fetchVersions() {
        Service.shared.fetchVersion(modelId: modelId) { versions in
            if let versions = versions {
                self.versionsInfo.append(contentsOf: versions)
            }
        }
    }
    
    func fetchVehicles() {
        loadingMovies = true
        Service.shared.fetchVehicles(page: currentPage) { vehicles in
            if let vehicles = vehicles {
                self.vehiclesInfo.append(contentsOf: vehicles)
            }
            DispatchQueue.main.async {
                self.loadingMovies = false
                self.collectionView.reloadData()
            }
        }
    }
}

//MARK: - UICollectionViewDelegate/DataSource
extension ListCarViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vehiclesInfo.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ListCarCell
        let urlFull = "\(vehiclesInfo[indexPath.row].getImage())"
        let fullUrlArray = urlFull.components(separatedBy: "//")
        let url = fullUrlArray[1]
        
        if let urlPoster = URL(string: "https://\(url)") {
            cell.carImageView.kf.setImage(with: urlPoster)
        } else {
            cell.carImageView.image = UIImage(named: "notimage")
        }
        
        if let make = vehiclesInfo[indexPath.row].make {
            if let model = vehiclesInfo[indexPath.row].model {
                if let version = vehiclesInfo[indexPath.row].version {
                    if let price = vehiclesInfo[indexPath.row].price {
                        if let yearFab = vehiclesInfo[indexPath.row].yearFab {
                            if let yearModel = vehiclesInfo[indexPath.row].yearModel {
                                if let km = vehiclesInfo[indexPath.row].km {
                                    cell.makeCarLabel.text = make.uppercased()
                                    cell.modelCarLabel.text = model.uppercased()
                                    cell.versionCarLabel.text = version.uppercased()
                                    cell.priceCarLabel.text = price.currencyInputFormatting()
                                    cell.yearsFabCarLabel.text = yearFab.description.uppercased()
                                    cell.yearsModelCarLabel.text = yearModel.description.uppercased()
                                    cell.kmCarLabel.text = "\(km.description.uppercased()) km"
                                }
                            }
                        }
                    }
                }
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return Utilities().sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Utilities().sectionInsets.left
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = DetailsCarViewController()
        controller.carImage = vehiclesInfo[indexPath.row].image ?? ""
        controller.priceCar = vehiclesInfo[indexPath.row].price ?? ""
        controller.yearModel = vehiclesInfo[indexPath.row].yearModel ?? 0
        controller.yearFab = vehiclesInfo[indexPath.row].yearFab ?? 0
        controller.colorCar = vehiclesInfo[indexPath.row].color ?? ""
        controller.kmCar = vehiclesInfo[indexPath.row].km ?? 0
        controller.makecar = vehiclesInfo[indexPath.row].make ?? ""
        controller.modelCar = vehiclesInfo[indexPath.row].model ?? ""
        controller.versionCar = vehiclesInfo[indexPath.row].version ?? ""
        navigationController?.pushViewController(controller, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == vehiclesInfo.count - 1 && !loadingMovies {
            currentPage += 1
            if vehiclesInfo.count > 0 {
                fetchVehicles()
            }
            print("Loading more vehicles")
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ListCarViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = Utilities().sectionInsets.left * (Utilities().itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / Utilities().itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem + 40)
    }
}

