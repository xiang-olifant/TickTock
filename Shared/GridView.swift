//
//  GridView.swift
//  TickTock
//
//  Created by Chang Chu on 9/12/22.
//

import Foundation
import SwiftUI

public struct GridView: View {
    @Binding var timerSet: TimeIntervalModel?
    @ObservedObject var timeIntervalRepo: TimeIntervalRepository
    
    let buttonSize: CGFloat = 200
    let minSpacing: CGFloat = 32
    
    public var body: some View {
        
        let item = GridItem(.fixed(buttonSize), spacing: minSpacing, alignment: .center)
        let columns = [item, item, item]
        
        return VStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: minSpacing) {
                    ForEach(timeIntervalRepo.models, id: \.self) {
                        RoundButton(timerSet: $timerSet, viewModel: $0)
                    }
                }.padding(.vertical, 40)
            }
            .frame(alignment: .center)
        }
    }

}
