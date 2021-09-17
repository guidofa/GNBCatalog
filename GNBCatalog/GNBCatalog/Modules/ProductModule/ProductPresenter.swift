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
    func getProduct()
}

class ProductPresenter: ProductModule.Presenter, ProductPresenterProtocol {
    var product: TransactionEntity?
    func getRates() {
        interactor?.getRates()
    }
    
    func getRatesSuccess(data: [RateEntity]) {
        print(data)
    }
    
    func getProduct() {
        guard let product = product else { return }
        view?.setProduct(product: product)
    }
}
