//
//  StateCard.swift
//  COVID
//
//  Created by hawkeyeshi on 7/17/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct StateCard: View {
    @EnvironmentObject var historicalStates: HistoricalStatesViewModel
    
    let forState: String
    
    @Binding var showSheet: Bool
    
    var body: some View {
        ForEach(historicalStates.states[forState]?.prefix(1) ?? [emptyState], id: \.id) { state in
            VStack(spacing: 10) {
                HStack {
                    Button(action: {
                        self.showSheet.toggle()
                    }) {
//                        Image(systemName: "mappin")
                        
                        Text(stateMap[self.forState] ?? self.forState)
                        
                        Image(systemName: "arrowtriangle.down.fill")
                            .font(.system(size: 10))
                            .foregroundColor(.blue)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                }
                .title()
                
                HStack {
                    DataGroupView(number: state.positive, label: "Confirmed", percentChange: self.historicalStates.positivePercentChange(forState: self.forState))
                    
                    DataGroupView(number: state.death, label: "Deaths", percentChange: self.historicalStates.deathPercentChange(forState: self.forState))
                }
            }
        }
        .card()
    }
}

struct StateCard_Previews: PreviewProvider {
    static var previews: some View {
        StateCard(forState: "NC", showSheet: .constant(false))
    }
}
