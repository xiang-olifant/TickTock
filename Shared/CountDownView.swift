//
//  CountDownView.swift
//  TickTock
//
//  Created by Chang Chu on 9/12/22.
//

import SwiftUI

public struct CountDownView: View {
    @Binding var timerSet: TimeIntervalModel?
    var viewModel: TimeIntervalModel
    @State var timeRemaining: TimeInterval?
    @State var color: Color
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    public init(timerSet: Binding<TimeIntervalModel?>) {
        _timerSet = timerSet
        viewModel = timerSet.wrappedValue ?? .init(timeInterval: 0)!
        _timeRemaining = .init(wrappedValue: timerSet.wrappedValue?.timeInterval)
        _color = .init(initialValue: timerSet.wrappedValue?.timeInterval == nil ?
                       Color.randonMyColor : .init(myColorDescription: viewModel.color))
    }
    
    public var body: some View {
        return ZStack {
            color.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text(timeRemaining?.timeString ?? "DONE")
                    .font(.title)
                    .fontWeight(.bold)
                    .onReceive(timer) { time in
                        if timeRemaining ?? 0 > 1 {
                            timeRemaining! -= 1
                        } else {
                            color = .randonMyColor
                            timeRemaining = nil
                        }
                    }
                Spacer()
                
                Button("Back", action: { timerSet = nil })
                    .padding([.bottom], 40)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    var backgroundColor: Color {
        timeRemaining == nil ? Color.randonMyColor : .init(myColorDescription: viewModel.color)
    }
}

//
//struct CountDownView_Previews: PreviewProvider {
//    static var previews: some View {
//        CountDownView(timerSet: .constant(nil))
//    }
//}
