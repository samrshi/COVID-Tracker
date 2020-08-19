//
//  StatePickerView.swift
//  COVID
//
//  Created by hawkeyeshi on 7/22/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI
import Foundation

struct StatePickerView: View {
    @EnvironmentObject var userSettings: UserSettings
    @EnvironmentObject var historicStates: HistoricalStatesViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    var statesArray: [String] {
        self.historicStates.statesArray.map({ $0.state })
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List(statesArray, id: \.self) { state in
                    Button(action: {
                            self.userSettings.favoriteState = state
                            self.presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Text(stateMap[state] ?? state)
                            Spacer()
                            if state == self.userSettings.favoriteState {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Pick State")
            .navigationBarItems(trailing: Button("Done") {
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct StatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        StatePickerView()
    }
}
