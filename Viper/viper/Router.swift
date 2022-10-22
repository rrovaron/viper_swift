//
//  Router.swift
//  Viper
//
//  Created by Rodrigo Rovaron on 20/10/22.
//

import Foundation
import UIKit
// Object
// Entry point


typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry: EntryPoint? { get }
    static func start() -> AnyRouter
}

class UserRounter: AnyRouter {
    
    var entry: EntryPoint?
    static func start() -> AnyRouter {
        let router = UserRounter()
        
        // assign VIP
        var view: AnyView = UserViewController()
        var presenter: AnyPresenter = UserPresenter()
        var interactor: AnyInteractor = UserInteractor()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.entry = view as? EntryPoint
        return router
    }
     
}
