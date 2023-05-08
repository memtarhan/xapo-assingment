//
//  Date+.swift
//  Repos
//
//  Created by Mehmet Tarhan on 05/05/2023.
//

import Foundation

extension Date {
    
    /// Date as displayed in views
    var displayable: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, hh:mm"
        return dateFormatter.string(from: self)
    }
    
    
    /// Date as given as a query parameter 
    var inQueryFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        return dateFormatter.string(from: self)
    }
}
