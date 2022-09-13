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

public class RoundButtonViewModel: Hashable {
    var timeInterval: TimeInterval
    var buttonSize: CGFloat
    var color: Color
    
    var id: UUID
    
    init?(timeInterval: TimeInterval, buttonSize: CGFloat, color: Color? = nil) {
        self.timeInterval = timeInterval
        self.buttonSize = buttonSize
        self.color = color ?? .randonMyColor
        guard timeInterval.timeString != nil else { return nil }
        self.id = UUID()
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: RoundButtonViewModel, rhs: RoundButtonViewModel) -> Bool {
        lhs.id == rhs.id
    }
}
