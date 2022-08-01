//
//  HomeWireframe.swift
//  StreamingApp
//
//  Created by FGX on 2022/08/01.
//

import Foundation
class HomeWireFrame : HomeWireFrameProtocol {
    static func createHomeModule() -> HomeView {
        let view: HomeView & PresenterToViewHomeProtocol = HomeView()
        var interactor: PresenterToInteractorHomeProtocol = HomeInteractor()
        var presenter: ViewToPresenterHomeProtocol & InteractorToPresenterHomeProtocol = HomePresenter()
        var router: PresenterToRouterHomeProtocol = HomeRouter()
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
        presenter.router = router
        router.view = view
        return view
    }
}
