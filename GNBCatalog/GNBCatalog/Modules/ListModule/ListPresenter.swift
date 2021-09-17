//
//  ListPresenter.swift
//  GNBCatalog
//
//  Created by Guido Fabio on 16/09/2021.
//

import Foundation

protocol ListPresenterProtocol: BasePresenterProtocol {
    func getProducts()
    func getTransactionsSuccess(data: [TransactionEntity])
}

class ListPresenter: ListModule.Presenter, ListPresenterProtocol {
    fileprivate var transactions: [TransactionEntity] = []
    
    func getProducts() {
        interactor?.getTransactions()
    }
    
    func getTransactionsSuccess(data: [TransactionEntity]) {
        getProducts(data: data)
    }
    
    func getProducts(data: [TransactionEntity]) {
        transactions = data
        view?.getProductsSuccess(products: filterUniqueProducts(transactions: data))
    }
    
    func filterUniqueProducts(transactions: [TransactionEntity]) -> [TransactionEntity] {
        var uniqueProducts: [TransactionEntity] = []
        var previousTransaction: TransactionEntity?
        for transaction in transactions {
            if let previousTransaction = previousTransaction {
                if previousTransaction.sku != transaction.sku {
                    uniqueProducts.append(transaction)
                }
            } else {
                uniqueProducts.append(transaction)
            }
            previousTransaction = transaction
        }
        return uniqueProducts
    }
}
