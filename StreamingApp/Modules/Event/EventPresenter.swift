//
//  EventPresenter.swift
//  StreamingApp
//
//  Created by FGX on 2022/08/01.
//

import Foundation

class EventPresenter: ViewToPresenterEventProtocol {
   
    
    var view: PresenterToViewEventProtocol?
    var interactor: PresenterToInteractorEventProtocol?
    var router: PresenterToRouterEventProtocol?
    func viewDidLoad() {
        interactor?.getEvents()
    }
    func open(videoUrl: String) {
        router?.playback(videoUrl: videoUrl )
    }
}

extension EventPresenter : InteractorToPresenterEventProtocol {
    func success(eventData: [EventData]) {
        view?.updateView(eventData: eventData)
    }
    func failure(error: Error) {
    }
}
