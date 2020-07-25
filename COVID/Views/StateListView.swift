//
//  StateListView.swift
//  COVID
//
//  Created by hawkeyeshi on 7/17/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct StateListView: View {
    @EnvironmentObject var historicStates: HistoricalStatesViewModel
    @State var keys = [String]()
    @State var values = [[Double]]()
    
    @State private var currentKey = ""
    @State private var currentValue = [Double]()
    
    @State private var showingSheet = false
    
    var body: some View {
        List(keys, id: \.self) { key in
            Button(key) {
                self.currentKey = key
                self.currentValue = self.historicStates.states[key] ?? [-1.0]
                self.showingSheet.toggle()
            }
        }
        .onAppear {
            self.keys = self.historicStates.states.map( {
                $0.key
            })
            self.values = self.historicStates.states.map( {
                $0.value
            })
            
            self.currentKey = self.keys[0]
            self.currentValue = self.values[0]
        }
    }
}

struct StateListView_Previews: PreviewProvider {
    static var previews: some View {
        StateListView()
    }
}
