//
//  TransactionEntity.swift
//  GNBCatalog
//
//  Created by Guido Fabio on 16/09/2021.
//

import Foundation

struct TransactionEntity: Codable {
    var sku: String
    var amount: String
    var currency: String
}
