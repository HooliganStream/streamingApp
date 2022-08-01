//
//  ScheduleWireFrame.swift
//  StreamingApp
//
//  Created by FGX on 2022/08/01.
//

import Foundation
import UIKit

class ScheduleWireFrame : ScheduleWireFrameProtocol {
    static func createScheduleModule() -> ScheduleView {
        let view: ScheduleView & PresenterToViewScheduleProtocol = ScheduleView(collectionViewLayout: UICollectionViewFlowLayout())
        var interactor: PresenterToInteractorScheduleProtocol = ScheduleInteractor()
        var presenter: ViewToPresenterScheduleProtocol & InteractorToPresenterScheduleProtocol = SchedulePresenter()
        var router: PresenterToRouterScheduleProtocol = ScheduleRouter()
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
        presenter.router = router
        router.view = view
        return view
    }
}
