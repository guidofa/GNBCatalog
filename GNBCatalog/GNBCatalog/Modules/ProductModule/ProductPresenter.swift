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
    func getProductTransactions()
}

class ProductPresenter: ProductModule.Presenter, ProductPresenterProtocol {
    var transactionsOfProduct: [TransactionEntity] = []
    var rates: [RateEntity] = []
    
    func getRates() {
        interactor?.getRates()
    }
    
    func getRatesSuccess(data: [RateEntity]) {
        rates = data
        getSumInEUR()
    }
    
    func getProductTransactions() {
        view?.setProductTransactions(transactions: transactionsOfProduct)
    }
    
    func getSumInEUR() {
        changeAllToEur()
        getSum()
    }
        
    func changeAllToEur() {
        for index in 0...transactionsOfProduct.count-1 where transactionsOfProduct[index].currency != "EUR" {
            toEUR(index: index)
        }
    }
    
    func toEUR(index: Int) {
        for rate in rates where transactionsOfProduct[index].currency == rate.from && rate.to == "EUR" {
            changeCurrency(index: index, rate: rate)
            return
        }
        for rate in rates where transactionsOfProduct[index].currency == rate.from {
            changeCurrency(index: index, rate: rate)
            toEUR(index: index)
            return
        }
    }
    
    func changeCurrency(index: Int, rate: RateEntity) {
        transactionsOfProduct[index].currency = rate.to
        transactionsOfProduct[index].amount = "\(transactionsOfProduct[index].amountDecimal * rate.rateDecimal)"
    }
    
    func getSum() {
        var sum: Decimal = 0
        for transaction in transactionsOfProduct {
            sum += transaction.amountDecimal
        }
        print("SUM: \(sum)")
    }
}
