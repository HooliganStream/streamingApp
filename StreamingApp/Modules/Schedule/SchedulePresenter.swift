//
//  SchedulePresenter.swift
//  StreamingApp
//
//  Created by FGX on 2022/08/01.
//

import Foundation
class SchedulePresenter: ViewToPresenterScheduleProtocol {
    var view: PresenterToViewScheduleProtocol?
    var interactor: PresenterToInteractorScheduleProtocol?
    var router: PresenterToRouterScheduleProtocol?
    
    func viewDidLoad() {
        interactor?.getSchedule()
    }
}

extension SchedulePresenter : InteractorToPresenterScheduleProtocol {
    func success(eventData: [EventData]) {
        view?.updateView(eventData:eventData)
    }
    
    func failure(error: Error) {
        
    }
    
    
}
