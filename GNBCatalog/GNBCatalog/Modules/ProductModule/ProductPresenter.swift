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
        view?.setSum(sum: "Total: \(getSum(transactions: transactionsOfProduct))")
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
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.roundingMode = .halfEven

        let amount = transactionsOfProduct[index].amountDecimal * rate.rateDecimal
        transactionsOfProduct[index].amount = formatter.string(for: amount) ?? "0"
    }
    
    func getSum(transactions: [TransactionEntity]) -> Decimal {
        var sum: Decimal = 0
        for transaction in transactions {
            sum += transaction.amountDecimal
        }
        return sum
    }
}
