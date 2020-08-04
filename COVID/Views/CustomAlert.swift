//
//  CustomAlert.swift
//  COVID
//
//  Created by hawkeyeshi on 8/3/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct CustomAlert: View {
    @Binding var showAlert: Bool
    @Binding var alertTitle: String
    @Binding var alertMessage: String
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                VStack {
                    Text(self.alertTitle)
                        .fontWeight(.bold)
                    Text(self.alertMessage)
                        .font(.caption)
                }
                Spacer()
            }
            .padding()
            .background(Color.red)
            .cornerRadius(10)
            .padding(.horizontal, 10)
            .offset(y: showAlert ? 20 : -200)
            .animation(.easeIn)
        }
    }
}

struct CustomAlert_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlert(showAlert: .constant(true), alertTitle: .constant("Title"), alertMessage: .constant("Message"))
    }
}
