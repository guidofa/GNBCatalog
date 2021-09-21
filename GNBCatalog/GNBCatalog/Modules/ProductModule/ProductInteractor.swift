//
//  ProductInteractor.swift
//  GNBCatalog
//
//  Created by Guido Fabio on 17/09/2021.
//

import Foundation

protocol ProductInteractorProtocol {
    func getRates()
}

class ProductInteractor: ProductModule.Interactor, ProductInteractorProtocol {
    func getRatesURL() -> String {
        return "http://quiet-stone-2094.herokuapp.com/rates.json"
    }
    
    func getRates() {
        Network.loadJson(fromURLString: getRatesURL()) { (result) in
            switch result {
            case .success(let data):
                self.parse(jsonData: data)
            case .failure(let error):
                // Show error
                print(error.localizedDescription)
            }
        }
    }
    
    private func parse(jsonData: Data) {
        do {
            let decodedData = try JSONDecoder().decode([RateEntity].self, from: jsonData)
            presenter?.getRatesSuccess(data: decodedData)
        } catch {
            // Show error
        }
    }
}
