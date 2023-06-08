//
//  VIP.swift
//  NavigationTest
//
//  Created by Ivan Kozlov on 08.06.2023.
//

import UIKit

protocol PresenterProtocol {
    
    associatedtype View: ViewProtocol
    
    var view: View? { set get }
}

protocol InteractorProtocol {
    
    associatedtype Presenter: PresenterProtocol
    associatedtype Coordinator: CoordinatorProtocol
    
    var presenter: Presenter? { set get }
    var coordinator: Coordinator? { set get }
    
    init(presenter: Presenter, coordinator: Coordinator)
    
}

protocol ViewProtocol: UIViewController {
    
    associatedtype Interactor: InteractorProtocol
    
    var interactor: Interactor? { set get }
    
    init(interactor: Interactor)
    
}

/*
 Node
 */

enum ShowStyle {
    case root
    case tabbar
    case modal
    case push
    case splash
}

protocol NodeProtocol {
    
    associatedtype View: ViewProtocol
    associatedtype Interactor: InteractorProtocol
    associatedtype Presenter: PresenterProtocol
    associatedtype Coordinator: CoordinatorProtocol
    
    var view: View { get }
    var intercator: Interactor { get }
    var presenter: Presenter { get }
    
    var showStyle: ShowStyle { get }
    
    var coordinator: Coordinator? { set get }
    
    init(coordinator: Coordinator)
    
}

protocol CoordinatorProtocol {
    
    associatedtype Container: UIViewController
    
    var hostVC: Container { get }
    var nodes: [any NodeProtocol] { set get }
    
    func set(nodes: [any NodeProtocol])
    func show(node: any NodeProtocol)
    
}

extension CoordinatorProtocol where Container: UINavigationController {
    
    func set(nodes: [any NodeProtocol]) {
        hostVC.setViewControllers(nodes.map { $0.view }, animated: false)
    }
    
    func show(node: any NodeProtocol) {
        switch node.showStyle {
        case .push:
            hostVC.pushViewController(node.view, animated: true)
        case .modal:
            hostVC.present(node.view, animated: true)
        default:
            fatalError("showStyle not supported")
        }
    }
    
}

protocol ModuleProtocol {
    
    associatedtype Coordinator: CoordinatorProtocol
    
    var submodules: [any ModuleProtocol] { get }
    var coordinator: Coordinator { get }
    
}
