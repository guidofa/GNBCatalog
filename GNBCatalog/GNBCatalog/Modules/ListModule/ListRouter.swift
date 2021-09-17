//
//  ListRouter.swift
//  GNBCatalog
//
//  Created by Guido Fabio on 16/09/2021.
//

import Foundation

protocol ListRouterProtocol: NSObject {
    func goToProductDetail()
}

class ListRouter: ListModule.Router, ListRouterProtocol {
    func goToProductDetail() {
        presenter?.navigation?.pushViewController(ProductModule.assemble(), animated: true)
    }
}
