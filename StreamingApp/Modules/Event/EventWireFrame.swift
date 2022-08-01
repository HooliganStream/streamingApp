//
//  EventWireFrame.swift
//  StreamingApp
//
//  Created by FGX on 2022/08/01.
//

import Foundation
import UIKit
class EventWireFrame : EventWireFrameProtocol {
    static func createEventModule() -> EventView {
        let view: EventView & PresenterToViewEventProtocol = EventView(collectionViewLayout: UICollectionViewFlowLayout())
        var interactor: PresenterToInteractorEventProtocol = EventInteractor()
        var presenter: ViewToPresenterEventProtocol & InteractorToPresenterEventProtocol = EventPresenter()
        var router: PresenterToRouterEventProtocol = EventRouter()
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
        presenter.router = router
        router.view = view
        return view
    }
}
