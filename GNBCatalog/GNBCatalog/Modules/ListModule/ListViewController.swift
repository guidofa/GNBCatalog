//
//  ListViewController.swift
//  GNBCatalog
//
//  Created by Guido Fabio on 16/09/2021.
//

import UIKit

protocol ListViewProtocol: UIViewController {
    func getProductsSuccess(products: [TransactionEntity])
}

class ListViewController: ListModule.View, ListViewProtocol {
    @IBOutlet fileprivate weak var tableView: UITableView!
    
    var products: [TransactionEntity]? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    static func create() -> ListViewController {
        if let listController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "ListViewController")
            as? ListViewController {
            return listController
        }
        return ListViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getProducts()
    }
    
    func getProductsSuccess(products: [TransactionEntity]) {
        self.products = products
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let products = products else { return UITableViewCell() }
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as? ProductCell {
            cell.configure(with: products[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let products = products else { return }
        presenter?.goToProductDetail(product: products[indexPath.row])
    }
}
