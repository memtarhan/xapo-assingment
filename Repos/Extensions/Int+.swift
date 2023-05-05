//
//  Int+.swift
//  Repos
//
//  Created by Mehmet Tarhan on 05/05/2023.
//

import Foundation

extension Int {
    /**
        Returns a string value of description. i.e 1500: 1.5k 45099: 45k
     */
    var asCountDescription: String {
        if self < 1000 {
            return "\(self)"

        } else if self < 1000000 {
            return String(format: "%.1fk", Double(self) / 1000)

        } else {
            return String(format: "%.1fm", Double(self) / 1000000)
        }
    }
}
