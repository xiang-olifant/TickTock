//
//  ContentView.swift
//  Shared
//
//  Created by Chang Chu on 9/12/22.
//

import SwiftUI

struct ContentView: View {
    @State var timerSet: TimeIntervalModel?
    
    var body: some View {
        VStack {
            if timerSet == nil {
                GridView(timerSet: $timerSet, timeIntervalRepo: TimeIntervalRepository())
            } else {
                CountDownView(timerSet: $timerSet)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
