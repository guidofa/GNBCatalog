//
//  ProductPresenter.swift
//  GNBCatalog
//
//  Created by Guido Fabio on 17/09/2021.
//

import Foundation

protocol ProductPresenterProtocol: NSObject {
    func getRates()
    func getRatesSuccess(data: [RateEntity])
}

class ProductPresenter: ProductModule.Presenter, ProductPresenterProtocol {
    func getRates() {
        interactor?.getRates()
    }
    
    func getRatesSuccess(data: [RateEntity]) {
        print(data)
    }
}
