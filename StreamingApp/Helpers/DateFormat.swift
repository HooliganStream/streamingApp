//
//  DateFormatter.swift
//  StreamingApp
//
//  Created by FGX on 2022/08/01.
//

import Foundation


class DateFormat {
    static  func formatDate(date:String) -> (format: String, date: Date) {
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        
        let defaultprint = DateFormatter()
        defaultprint.dateFormat = "dd.MM.yyyy"
        
        let hourprint = DateFormatter()
        hourprint.dateFormat = "HH:mm"
        
        
        if let date = dateFormatterGet.date(from: date) {
            if(Calendar.current.isDateInTomorrow(date)) {
               
                return ("Tomorrow, \(hourprint.string(from: date))", date)
                
            }
            if(Calendar.current.isDateInToday(date)) {
               
                return ("Today, \(hourprint.string(from: date))", date)
                
            }
            if(Calendar.current.isDateInYesterday(date)) {
                return ("Yesterday, \(hourprint.string(from: date))", date)
                
            }
            return (defaultprint.string(from: date), date)
           
        }
    
        return ("", Date.now)
        
        
       
    }
}
