//
//  GNBCatalogTests.swift
//  GNBCatalogTests
//
//  Created by Guido Fabio on 16/09/2021.
//

import XCTest
@testable import GNBCatalog

class GNBCatalogTests: XCTestCase {
    var correctRatesUrl: String!
    var correctTransactionsUrl: String!
    
    override func setUp() {
        super.setUp()
        correctRatesUrl = "http://quiet-stone-2094.herokuapp.com/rates.json"
        correctTransactionsUrl = "http://quiet-stone-2094.herokuapp.com/transactions.json"
    }
    
    override func tearDown() {
        super.tearDown()
        correctRatesUrl = nil
        correctTransactionsUrl = nil
    }
    
    func testRatesUrl_shouldpassIfCorrectUrl() {
        let sut = ProductInteractor()
        XCTAssertTrue(correctRatesUrl == sut.getRatesURL())
    }
    
    func testTransactionsUrl_shouldpassIfCorrectUrl() {
        let sut = ListInteractor()
        XCTAssertTrue(correctTransactionsUrl == sut.getTransactionsUrl())
    }
    
    func testGetSum() {
        // given
        let sut = ProductPresenter()
        let transactions = [TransactionEntity(sku: "G2432", amount: "9", currency: "EUR"), TransactionEntity(sku: "G2432", amount: "34.2", currency: "EUR")]
        
        // when
        let result = sut.getSum(transactions: transactions)
        
        // then
        XCTAssertEqual(result, Decimal(43.2))
    }
}
