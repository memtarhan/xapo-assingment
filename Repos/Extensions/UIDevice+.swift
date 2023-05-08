//
//  DeviceOrientation.swift
//  Repos
//
//  Created by Mehmet Tarhan on 08/05/2023.
//

import SwiftUI

extension UIDevice {
    
    /// A variable to determine device orientation
    var isPortrait: Bool {
        guard let scene = UIApplication.shared.windows.first?.windowScene else { return true }
        return scene.interfaceOrientation.isPortrait
    }
}
