//
//  ListViewController.swift
//  GNBCatalog
//
//  Created by Guido Fabio on 16/09/2021.
//

import UIKit

protocol ListViewProtocol: UIViewController {
    
}

class ListViewController: ListModule.View, ListViewProtocol {
    static func create() -> ListViewController {
        if let listController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "ListViewController")
            as? ListViewController {
            return listController
        }
        return ListViewController()
    }
}
