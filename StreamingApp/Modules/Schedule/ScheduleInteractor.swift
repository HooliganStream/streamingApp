//
//  ScheduleInteractor.swift
//  StreamingApp
//
//  Created by FGX on 2022/08/01.
//

import Foundation
import UIKit

class ScheduleInteractor:PresenterToInteractorScheduleProtocol {
    var presenter: InteractorToPresenterScheduleProtocol?
    
    func getSchedule() {
        if let scheduleEndpoint = Bundle.main.infoDictionary?["SCHEDULE_ENDPOINT"]  as? String {
           
            print("https://"+scheduleEndpoint)
            let url = URL(string: "https://"+scheduleEndpoint)!
            HttpRequestService.get(url: url, type: [EventData].self) { [self] success, response, error in
                if success, let response = response as? [EventData]{
                    var filtered = response.filter{
                         Calendar.current.isDateInTomorrow(DateFormat.formatDate(date: $0.date).date)
                    }
                    
                    filtered.sort { (e1,e2) in
                        let f1  = DateFormat.formatDate(date: e1.date)
                        let f2  = DateFormat.formatDate(date: e2.date)
                        return f2.date > f1.date
                    }
                    presenter?.success(eventData: filtered)
                } else {
                
                    presenter?.failure(error: error!)
                }
            }
        }
    }
}
