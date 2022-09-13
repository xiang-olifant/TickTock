//
//  GridView.swift
//  TickTock
//
//  Created by Chang Chu on 9/12/22.
//

import Foundation
import SwiftUI

public struct GridView: View {
    @Binding var timerSet: RoundButtonViewModel?
    
    let buttonSize: CGFloat = 200
    let minSpacing: CGFloat = 32
    
    public var body: some View {
        let models: [RoundButtonViewModel] = [
            .init(timeInterval: 60, buttonSize: buttonSize),
            .init(timeInterval: TimeInterval(5 * 60), buttonSize: buttonSize),
            .init(timeInterval: TimeInterval(10 * 60), buttonSize: buttonSize),
            .init(timeInterval: TimeInterval(25 * 60), buttonSize: buttonSize),
            .init(timeInterval: TimeInterval(55 * 60), buttonSize: buttonSize),
            .init(timeInterval: TimeInterval(60 * 60), buttonSize: buttonSize)
        ].compactMap { $0 }
        
        let item = GridItem(.fixed(buttonSize), spacing: minSpacing, alignment: .center)
        let columns = [item, item, item]
        
        return VStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: minSpacing) {
                    ForEach(models, id: \.self) {
                        RoundButton(timerSet: $timerSet, viewModel: $0)
                    }
                }.padding(.vertical, 40)
            }
            .frame(alignment: .center)
        }
    }

}
