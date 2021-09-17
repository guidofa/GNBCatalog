//
//  ProductCell.swift
//  GNBCatalog
//
//  Created by Guido Fabio on 17/09/2021.
//

import UIKit

final class ProductCell: UITableViewCell {
    @IBOutlet fileprivate weak var productSKULabel: UILabel!
    
    func configure(with product: TransactionEntity) {
        productSKULabel.text = product.sku
    }
}
