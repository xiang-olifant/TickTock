//
//  ContentView.swift
//  Shared
//
//  Created by Chang Chu on 9/12/22.
//

import SwiftUI

struct ContentView: View {
    @State var timerSet: RoundButtonViewModel?
    
    var body: some View {
        VStack {
            if timerSet == nil {
                GridView(timerSet: $timerSet)
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
