//
//  EventContracts.swift
//  StreamingApp
//
//  Created by FGX on 2022/08/01.
//

import Foundation
import UIKit

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterEventProtocol {
    var view: PresenterToViewEventProtocol? { get set }
    var interactor: PresenterToInteractorEventProtocol? { get set }
    var router: PresenterToRouterEventProtocol? { get set }
    func viewDidLoad()
    func open(videoUrl: String)
}
// MARK: View Output (Presenter -> View)
protocol PresenterToViewEventProtocol {
    var presenter: ViewToPresenterEventProtocol? { get set }
    func updateView(eventData: [EventData])
}
   
// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorEventProtocol {
    var presenter: InteractorToPresenterEventProtocol? { get set }
    func getEvents()
}
// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterEventProtocol {
   
    func success(eventData: [EventData])
    func failure(error:Error)
}
// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterEventProtocol {
    var view:UIViewController? { get set }
    func playback(videoUrl: String)
  
}
protocol EventWireFrameProtocol {
    static func createEventModule() -> EventView

}

