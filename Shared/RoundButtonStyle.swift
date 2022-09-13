//
//  RoundButtonStyle.swift
//  TickTock
//
//  Created by Chang Chu on 9/11/22.
//

import Foundation
import SwiftUI

public struct RoundButtonStyle: ButtonStyle {
    let color: Color
    
    public init(_ color: Color) {
        self.color = color
    }
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .modifier(MakeSquareBounds())
            .background(Circle().fill(color))
    }
}

public struct MakeSquareBounds: ViewModifier {
    @State var size: CGFloat = 1000
    
    public func body(content: Content) -> some View {
        let c = ZStack {
            content.alignmentGuide(HorizontalAlignment.center) { (vd) -> CGFloat in
                DispatchQueue.main.async {
                    self.size = max(vd.height, vd.width)
                }
                return vd[HorizontalAlignment.center]
            }
        }
        return c.frame(width: size, height: size)
    }
}

extension Color {
    static let grape = Color("Grape")
    static let lemon = Color("Lemon")
    static let matcha = Color("Matcha")
    static let oranges = Color("Orange")
    static let pistacho = Color("Pistacho")
    static let seaSalt = Color("SeaSalt")
    static let straberry = Color("Strawberry")
    static let violet = Color("Violet")
    static let watermelon = Color("Watermelon")
    
    static var randonMyColor: Color {
        let all: [Color] = [.grape, .lemon, .matcha,
                            .oranges, .pistacho, .seaSalt,
                            .straberry, .violet, .watermelon]
        return all.randomElement() ?? .watermelon
    }
}
