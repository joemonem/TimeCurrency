//
//  AboutView.swift
//  MoneyTimeConverter
//
//  Created by Joe Monem on 04/10/2023.
//

import SwiftUI

struct AboutView: View {
    @Binding var clickedAbout: Bool
    var body: some View {
        VStack {
            Text("View the price of an item, relative to your monthly income, in terms of the most valuable currency in the world").font(.title).padding()
            
            Text("(Time spent working)").font(.caption)
            Spacer()
            Button("Ok 🫣") {
                clickedAbout = false
            }
            
        }.padding()
        
    }
}

struct AboutView_Preview: PreviewProvider {
    static var previews: some View {
        AboutView(clickedAbout: .constant(true))
    }
}
