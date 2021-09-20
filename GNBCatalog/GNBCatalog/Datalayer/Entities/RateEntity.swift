//
//  RateEntity.swift
//  GNBCatalog
//
//  Created by Guido Fabio on 16/09/2021.
//

import Foundation

struct RateEntity: Codable {
    var from: String
    var to: String
    var rate: String
    var rateDecimal: Decimal {
        return Decimal(string: rate) ?? 0
    }
}
