//
//  ProductEntity.swift
//  GNBCatalog
//
//  Created by Guido Fabio on 16/09/2021.
//

import Foundation

struct ProductEntity: Codable {
    var sku: String
    var amount: Decimal
    var currency: String
}
