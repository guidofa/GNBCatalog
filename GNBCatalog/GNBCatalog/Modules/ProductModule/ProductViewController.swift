//
//  ProductViewController.swift
//  GNBCatalog
//
//  Created by Guido Fabio on 17/09/2021.
//

import UIKit

protocol ProductViewProtocol: ProductViewController {
    func setProduct(product: TransactionEntity)
}

class ProductViewController: ProductModule.View, ProductViewProtocol {
    static func create() -> ProductViewController {
        if let productViewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "ProductViewController")
            as? ProductViewController {
            return productViewController
        }
        return ProductViewController()
    }
    
    fileprivate var product: TransactionEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getProduct()
        presenter?.getRates()
    }
    
    func setProduct(product: TransactionEntity) {
        self.product = product
    }
}
