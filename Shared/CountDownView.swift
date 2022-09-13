//
//  CountDownView.swift
//  TickTock
//
//  Created by Chang Chu on 9/12/22.
//

import SwiftUI

public struct CountDownView: View {
    @Binding var timerSet: RoundButtonViewModel?
    var viewModel: RoundButtonViewModel
    @State var timeRemaining: TimeInterval?
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    public init(timerSet: Binding<RoundButtonViewModel?>) {
        _timerSet = timerSet
        viewModel = timerSet.wrappedValue ?? .init(timeInterval: 0, buttonSize: 200)!
        _timeRemaining = .init(wrappedValue: timerSet.wrappedValue?.timeInterval)
    }
    
    public var body: some View {
        return VStack {
            Spacer()
            
            Text(timeRemaining?.timeString ?? "DONE")
                .font(.title)
                .fontWeight(.bold)
                .onReceive(timer) { time in
                    if timeRemaining ?? 0 > 1 {
                        timeRemaining! -= 1
                    } else {
                        timeRemaining = nil
                    }
                }
            Spacer()
            
            Button("Back", action: { timerSet = nil })
                .padding([.bottom], 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(timeRemaining == nil ? Color.randonMyColor : viewModel.color)
    }
}

//
//struct CountDownView_Previews: PreviewProvider {
//    static var previews: some View {
//        CountDownView(timerSet: .constant(nil))
//    }
//}
