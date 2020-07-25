//
//  StateView.swift
//  COVID
//
//  Created by hawkeyeshi on 7/20/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct StateListView: View {
    @EnvironmentObject var historicStates: HistoricalStatesViewModel
    
    @State private var showingSheet = false
        
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                ForEach(historicStates.statesArray, id: \.id) { state in
                    NavigationLink(destination: Text(state.state)) {
                        StateCard(forState: state.state, showSheet: .constant(false)).environmentObject(self.historicStates)
                    }
                }
            }
            .navigationBarTitle("All States")
        }
    }
}

struct StateListView_Previews: PreviewProvider {
    static var previews: some View {
        StateListView()
    }
}
