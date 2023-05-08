//
//  DynamicValue+GeometryProxy.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 8.05.2023.
//

import SwiftUI

extension GeometryProxy {
    /// Dyanmic  height by device
    /// - Parameter height: Percent value
    /// - Returns: Calculated value for device height
    func dynamicHeight(height: Double) -> Double {
        return size.height * height
    }
    
    /// Dyanmic width by device
    /// - Parameter width: Percent value
    /// - Returns: Calculated value for device width
    func dynamicWidth(width: Double) -> Double {
        return size.width * width
    }
}
