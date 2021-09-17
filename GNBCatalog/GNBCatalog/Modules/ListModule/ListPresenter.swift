//
//  ListPresenter.swift
//  GNBCatalog
//
//  Created by Guido Fabio on 16/09/2021.
//

import Foundation

protocol ListPresenterProtocol: BasePresenterProtocol {
    func getTransactions()
    func getTransactionsSuccess(data: [TransactionEntity])
}

class ListPresenter: ListModule.Presenter, ListPresenterProtocol {
    func getTransactions() {
        interactor?.getTransactions()
    }
    
    func getTransactionsSuccess(data: [TransactionEntity]) {
        // We have all the transactions here
    }
}
