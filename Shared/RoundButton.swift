//
//  RoundButton.swift
//  TickTock
//
//  Created by Chang Chu on 9/11/22.
//

import Foundation
import SwiftUI

public struct RoundButton: View {
    @Binding var timerSet: RoundButtonViewModel?
    var viewModel: RoundButtonViewModel
    
    public var body: some View {
        Button(action: {
            timerSet = viewModel
        }) {
            Text(viewModel.timeInterval.timeString ?? "")
                .fontWeight(.bold)
                .font(.title3)
        }
        .frame(width: viewModel.buttonSize, height: viewModel.buttonSize)
        .buttonStyle(RoundButtonStyle(viewModel.color))
    }
}
