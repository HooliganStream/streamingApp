//
//  EventInteractor.swift
//  StreamingApp
//
//  Created by FGX on 2022/08/01
//

import Foundation

class EventInteractor:PresenterToInteractorEventProtocol {
    var presenter: InteractorToPresenterEventProtocol?
    func getEvents() {
        if let eventEndpoint = Bundle.main.infoDictionary?["EVENT_ENDPOINT"]  as? String {
           
            
            let url = URL(string: "https://"+eventEndpoint)!
            HttpRequestService.get(url: url, type: [EventData].self) { [self] success, response, error in
                if success, var response = response as? [EventData]{
                    
                    response.sort { (e1,e2) in
                        let f1  = DateFormat.formatDate(date: e1.date)
                        let f2  = DateFormat.formatDate(date: e2.date)
                        return f2.date > f1.date
                    }
                   
                    presenter?.success(eventData: response)
                } else {
                    presenter?.failure(error: error!)
                }
            }
        }
        
    }
    
}
