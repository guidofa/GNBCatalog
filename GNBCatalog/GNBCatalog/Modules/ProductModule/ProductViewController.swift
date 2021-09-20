//
//  ProductViewController.swift
//  GNBCatalog
//
//  Created by Guido Fabio on 17/09/2021.
//

import UIKit

protocol ProductViewProtocol: ProductViewController {
    func setProductTransactions(transactions: [TransactionEntity])
}

class ProductViewController: ProductModule.View, ProductViewProtocol {
    @IBOutlet fileprivate weak var tableView: UITableView!
    static func create() -> ProductViewController {
        if let productViewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "ProductViewController")
            as? ProductViewController {
            return productViewController
        }
        return ProductViewController()
    }
    
    fileprivate var transactionsToShow: [TransactionEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getProductTransactions()
        presenter?.getRates()
    }
    
    func setProductTransactions(transactions: [TransactionEntity]) {
        self.transactionsToShow = transactions
    }
}

extension ProductViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionsToShow.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell") as? TransactionCell {
            cell.configure(with: transactionsToShow[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}
