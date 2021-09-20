//
//  ProductModule.swift
//  GNBCatalog
//
//  Created by Guido Fabio on 17/09/2021.
//

import UIKit

class ProductModule: NSObject {
    static func assemble(transactionsToShow: [TransactionEntity]) -> ProductViewController {
        let view = ProductViewController.create()
        let presenter = ProductPresenter()
        let interactor = ProductInteractor()
        let router = ProductRouter()
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.transactionsOfProduct = transactionsToShow
        view.presenter = presenter
        interactor.presenter = presenter
        router.presenter = presenter        
        return view
    }
    
    class Presenter: NSObject {
        weak var view: ProductViewProtocol?
        var interactor: ProductInteractorProtocol?
        var router: ProductRouterProtocol?
        var navigation: UINavigationController? { return view?.navigationController }
    }
    
    class View: UIViewController {
        var presenter: ProductPresenterProtocol?
    }
    
    class Interactor: NSObject {
        var presenter: ProductPresenterProtocol?
    }
    
    class Router: NSObject {
        var presenter: ProductPresenterProtocol?
    }
}
