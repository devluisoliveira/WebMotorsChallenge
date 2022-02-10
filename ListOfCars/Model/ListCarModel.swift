//
//  ListCarModel.swift
//  ListOfCars
//
//  Created by Luis Eduardo Silva Oliveira on 09/02/22.
//

import Foundation

struct Vehicle: Codable {
    var id: Int? = 0
    var make: String? = ""
    var model: String? = ""
    var version: String? = ""
    var image: String? = ""
    var km: Int? = 0
    var price: String? = ""
    var yearModel: Int? = 0
    var yearFab: Int? = 0
    var color: String? = ""
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case make = "Make"
        case model = "Model"
        case version = "Version"
        case image = "Image"
        case km = "KM"
        case price = "Price"
        case yearModel = "YearModel"
        case yearFab = "YearFab"
        case color = "Color"
    }
    
    func getImage() -> String {
        guard let image = image else {return ""}
        
        let urlFull = "\(image)"
        return urlFull
    }
}

struct Make: Codable {
    var id: Int? = 0
    var name: String? = ""
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "Name"
    }
}

struct Model: Codable {
    var makeId: Int? = 0
    var id: Int? = 0
    var name: String? = ""
    
    enum CodingKeys: String, CodingKey {
        case makeId = "MakeID"
        case id = "ID"
        case name = "Name"
    }
}

struct VersionCar: Codable {
    var modelId: Int? = 0
    var id: Int? = 0
    var name: String? = ""
    
    enum CodingKeys: String, CodingKey {
        case modelId = "ModelID"
        case id = "ID"
        case name = "Name"
    }
}
