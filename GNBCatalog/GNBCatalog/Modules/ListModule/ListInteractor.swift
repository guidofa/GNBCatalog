//
//  ListInteractor.swift
//  GNBCatalog
//
//  Created by Guido Fabio on 16/09/2021.
//

import Foundation

protocol ListInteractorProtocol: NSObject {
    func getTransactions()
}

class ListInteractor: ListModule.Interactor, ListInteractorProtocol {
    func getTransactionsUrl() -> String {
        return "http://quiet-stone-2094.herokuapp.com/transactions.json"
    }
    
    func getTransactions() {
        Network.loadJson(fromURLString: getTransactionsUrl()) { (result) in
            switch result {
            case .success(let data):
                self.parse(jsonData: data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func parse(jsonData: Data) {
        do {
            let decodedData = try JSONDecoder().decode([TransactionEntity].self, from: jsonData)
            presenter?.getTransactionsSuccess(data: decodedData)
        } catch {
            print("Che esta salientdo por aca")
        }
    }
}
