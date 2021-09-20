//
//  TransactionCell.swift
//  GNBCatalog
//
//  Created by Guido Fabio on 18/09/2021.
//

import UIKit

final class TransactionCell: UITableViewCell {
    @IBOutlet fileprivate weak var transactionAmountLabel: UILabel!
    
    func configure(with transaction: TransactionEntity) {
        transactionAmountLabel.text = "\(transaction.amount) \(transaction.currency)"
    }
}
