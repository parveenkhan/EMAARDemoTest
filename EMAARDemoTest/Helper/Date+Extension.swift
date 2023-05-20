//
//  Date+Extension.swift
//  EMAARDemoTest
//
//  Created by Parveen Khan on 20/05/23.
//

import Foundation

extension Date {
    func dateWithShortMonthName(from dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" // Modify the format to match your input string
        
        if let date = dateFormatter.date(from: dateString) {
            let monthFormatter = DateFormatter()
            monthFormatter.dateFormat = "dd MMM yyyy" // Modify the format to match your desired output
            
            return monthFormatter.string(from: date)
        }
        
        return nil
    }
    
    func dateWithFullMonthName(from dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSX"
        
        if let date = dateFormatter.date(from: dateString) {
            let monthFormatter = DateFormatter()
            monthFormatter.dateFormat = "MMMM d, yyyy"
            
            return monthFormatter.string(from: date)
        }
        
        return nil
    }
    
   func formattedString() -> String {
        let dateFormatter = DateFormatter()
        
        if Calendar.current.isDateInYesterday(self) {
            dateFormatter.dateFormat = "h:mm a"
            return "Yesterday at " + dateFormatter.string(from: self)
        } else if Calendar.current.isDate(self, inSameDayAs: Date()) {
            dateFormatter.dateFormat = "h:mm a"
            return dateFormatter.string(from: self)
        } else {
            dateFormatter.dateFormat = "MMMM d, yyyy"
            return dateFormatter.string(from: self)
        }
    }
}
