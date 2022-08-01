//
//  HomeContracts.swift
//  StreamingApp
//
//  Created by FGX on 2022/08/01.
//

import Foundation
import UIKit

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterHomeProtocol {
    var view: PresenterToViewHomeProtocol? { get set }
    var interactor: PresenterToInteractorHomeProtocol? { get set }
    var router: PresenterToRouterHomeProtocol? { get set }
    func viewDidLoad()
}
// MARK: View Output (Presenter -> View)
protocol PresenterToViewHomeProtocol {
    var presenter: ViewToPresenterHomeProtocol? { get set }
}
   
// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorHomeProtocol {
    var presenter: InteractorToPresenterHomeProtocol? { get set }
  
}
// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterHomeProtocol {
   
}
// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterHomeProtocol {
    var view:UIViewController? { get set }
  
}
protocol HomeWireFrameProtocol {
    static func createHomeModule() -> HomeView

}

