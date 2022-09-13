//
//  RoundButtonViewModel.swift
//  TickTock
//
//  Created by Chang Chu on 9/11/22.
//

import Foundation
import SwiftUI

extension TimeInterval {
    var timeString: String? {
        DateComponentsFormatter().string(from: self)
    }
}

public class TimeIntervalModel: Hashable, Codable {
    var timeInterval: TimeInterval
    var color: String
    var id: String
    
    init?(timeInterval: TimeInterval, color: Color? = nil) {
        self.timeInterval = timeInterval
        self.color = color?.myColorDescription ?? Color.randonMyColor.myColorDescription
        guard timeInterval.timeString != nil else { return nil }
        self.id = UUID().uuidString
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: TimeIntervalModel, rhs: TimeIntervalModel) -> Bool {
        lhs.id == rhs.id
    }
}

extension TimeIntervalModel {
    var buttonSize: CGFloat { 200 }
}
