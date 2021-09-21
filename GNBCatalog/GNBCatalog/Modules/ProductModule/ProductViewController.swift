//
//  ProductViewController.swift
//  GNBCatalog
//
//  Created by Guido Fabio on 17/09/2021.
//

import UIKit

protocol ProductViewProtocol: ProductViewController {
    func setProductTransactions(transactions: [TransactionEntity])
    func setSum(sum: String)
}

class ProductViewController: ProductModule.View, ProductViewProtocol {
    @IBOutlet fileprivate weak var tableView: UITableView!
    @IBOutlet fileprivate weak var sumLabel: UILabel!
    
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
        title = transactionsToShow[0].sku
        presenter?.getRates()
    }
    
    func setProductTransactions(transactions: [TransactionEntity]) {
        self.transactionsToShow = transactions
    }
    
    func setSum(sum: String) {
        DispatchQueue.main.async {
            self.sumLabel.text = sum
        }
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
