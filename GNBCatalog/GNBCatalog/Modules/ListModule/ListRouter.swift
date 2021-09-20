//
//  ListRouter.swift
//  GNBCatalog
//
//  Created by Guido Fabio on 16/09/2021.
//

import Foundation

protocol ListRouterProtocol: NSObject {
    func goToProductDetail(transactions: [TransactionEntity])
}

class ListRouter: ListModule.Router, ListRouterProtocol {
    
    func goToProductDetail(transactions: [TransactionEntity]) {
        presenter?.navigation?.pushViewController(ProductModule.assemble(transactionsToShow: transactions),
                                                  animated: true)
    }
}
