//
//  ScheduleContracts.swift
//  StreamingApp
//
//  Created by FGX on 2022/08/01.
//

import Foundation
import UIKit


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterScheduleProtocol {
    var view: PresenterToViewScheduleProtocol? { get set }
    var interactor: PresenterToInteractorScheduleProtocol? { get set }
    var router: PresenterToRouterScheduleProtocol? { get set }
    func viewDidLoad()
}
// MARK: View Output (Presenter -> View)
protocol PresenterToViewScheduleProtocol {
    var presenter: ViewToPresenterScheduleProtocol? { get set }
    func updateView(eventData: [EventData])
}
   
// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorScheduleProtocol {
    var presenter: InteractorToPresenterScheduleProtocol? { get set }
    func getSchedule()
  
}
// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterScheduleProtocol {
    func success(eventData: [EventData])
    func failure(error:Error)
   
}
// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterScheduleProtocol {
    var view:UIViewController? { get set }
  
}
protocol ScheduleWireFrameProtocol {
    static func createScheduleModule() -> ScheduleView

}


