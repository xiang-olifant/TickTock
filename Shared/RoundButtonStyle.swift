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
    static let strawberry = Color("Strawberry")
    static let violet = Color("Violet")
    static let watermelon = Color("Watermelon")
    
    var myColorDescription: String {
        switch self {
        case .grape: return "grape"
        case .lemon: return "lemon"
        case .matcha: return "matcha"
        case .oranges: return "oranges"
        case .pistacho: return "pistacho"
        case .seaSalt: return "seaSalt"
        case .strawberry: return "strawberry"
        case .violet: return "violet"
        case .watermelon: return "watermelon"
        default: return ""
        }
    }
    
    init(myColorDescription: String) {
        switch myColorDescription {
        case "grape": self = .grape
        case "lemon": self = .lemon
        case "matcha": self = .matcha
        case "oranges": self = .oranges
        case "pistacho": self = .pistacho
        case "seaSalt": self = .seaSalt
        case "strawberry": self = .strawberry
        case "violet": self = .violet
        case "watermelon": self = .watermelon
        default: self = .randonMyColor
        }
    }
    
    static var randonMyColor: Color {
        let all: [Color] = [.grape, .lemon, .matcha,
                            .oranges, .pistacho, .seaSalt,
                            .strawberry, .violet, .watermelon]
        return all.randomElement() ?? .watermelon
    }
}
