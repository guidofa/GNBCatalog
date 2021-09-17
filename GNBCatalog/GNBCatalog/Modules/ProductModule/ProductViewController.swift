//
//  ProductViewController.swift
//  GNBCatalog
//
//  Created by Guido Fabio on 17/09/2021.
//

import UIKit

protocol ProductViewProtocol: ProductViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getRates()
    }
}
