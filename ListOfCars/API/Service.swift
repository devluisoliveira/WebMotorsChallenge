//
//  Service.swift
//  ListOfCars
//
//  Created by Luis Eduardo Silva Oliveira on 09/02/22.
//

import Alamofire

class Service {
    static let shared = Service()
    
    //MARK: - Get Make
    func fetchMake(onComplete: @escaping ([Make]?) -> Void) {
        let url: String
        url = "\(API_BASE)\(GET_MAKE)"
        print("DEBUG: url...: \(url)")
        
        Alamofire.request(url).responseJSON { (response) in
            guard let data = response.data else {
                onComplete(nil)
                return
            }
            do {
                let makeInfo = try JSONDecoder().decode([Make].self, from: data)
                onComplete(makeInfo)
            } catch {
                print(error.localizedDescription)
                onComplete(nil)
            }
        }
    }
    
    //MARK: - Get Model
    func fetchModel(makeId: Int, onComplete: @escaping ([Model]?) -> Void) {
        let url: String
        url = "\(API_BASE)\(GET_MODEL)\(makeId)"
        print("DEBUG: url...: \(url)")
        
        Alamofire.request(url).responseJSON { (response) in
            guard let data = response.data else {
                onComplete(nil)
                return
            }
            do {
                let modelInfo = try JSONDecoder().decode([Model].self, from: data)
                onComplete(modelInfo)
            } catch {
                print(error.localizedDescription)
                onComplete(nil)
            }
        }
    }
    
    //MARK: - Get Version
    func fetchVersion(modelId: Int, onComplete: @escaping ([VersionCar]?) -> Void) {
        let url: String
        url = "\(API_BASE)\(GET_VERSION)\(modelId)"
        print("DEBUG: url...: \(url)")
        
        Alamofire.request(url).responseJSON { (response) in
            guard let data = response.data else {
                onComplete(nil)
                return
            }
            do {
                let versionInfo = try JSONDecoder().decode([VersionCar].self, from: data)
                onComplete(versionInfo)
            } catch {
                print(error.localizedDescription)
                onComplete(nil)
            }
        }
    }
    
    //MARK: - Get Vehicles
    func fetchVehicles(page: Int, onComplete: @escaping ([Vehicle]?) -> Void) {
        let url: String
        url = "\(API_BASE)\(GET_VEHICLES)\(page)"
        print("DEBUG: url...: \(url)")
        
        Alamofire.request(url).responseJSON { (response) in
            guard let data = response.data else {
                onComplete(nil)
                return
            }
            do {
                let vehiclesInfo = try JSONDecoder().decode([Vehicle].self, from: data)
                onComplete(vehiclesInfo)
            } catch {
                print(error.localizedDescription)
                onComplete(nil)
            }
        }
    }
}
