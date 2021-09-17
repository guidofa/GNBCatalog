//
//  ListRouter.swift
//  GNBCatalog
//
//  Created by Guido Fabio on 16/09/2021.
//

import Foundation

protocol ListRouterProtocol: NSObject {
    func goToProductDetail(product: TransactionEntity)
}

class ListRouter: ListModule.Router, ListRouterProtocol {
    
    func goToProductDetail(product: TransactionEntity) {
        presenter?.navigation?.pushViewController(ProductModule.assemble(productToShow: product), animated: true)
    }
}
