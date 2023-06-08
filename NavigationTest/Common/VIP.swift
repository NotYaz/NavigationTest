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
    
    var presenter: Presenter { set get }
    
    init(presenter: Presenter)
    
}

protocol ViewProtocol: UIViewController {
    
    associatedtype Interactor: InteractorProtocol
    
    var interactor: Interactor { set get }
    
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
    
    var view: View { get }
    var intercator: Interactor { get }
    var presenter: Presenter { get }
    
    var showStyle: ShowStyle { get }
    
}

protocol CoordinatorProtocol {
    
    associatedtype Container: UIViewController
    
    var hostVC: Container { get }
    
    func set(nodes: [any NodeProtocol])
    func show(node: any NodeProtocol)
    
}

protocol ModuleProtocol {
    
    associatedtype Coordinator: CoordinatorProtocol
    
    var nodes: [any NodeProtocol] { set get }
    var submodules: [any ModuleProtocol] { get }
    var coordinator: Coordinator { get }
    
}
