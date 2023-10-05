//
//  ContentView.swift
//  MoneyTimeConverter
//
//  Created by Joe Monem on 03/10/2023.
//

import SwiftUI

struct ContentView: View {
    @Binding var user: User
    @Environment(\.scenePhase) private var scenePhase
    @State private var price: String = ""
    @State var isFirstTimeUser = false
    @State var clickedAbout = false

    
    let saveAction: ()->Void
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Greetings \(user.name)!")
                    .padding()
                    .font(.title)
                Text("What's the (true) price of today's item?").font(.subheadline)
                Form {
                    Section(header: Text("")) {
                        TextField("Price", text: $price)
                            .keyboardType(.numberPad)
                            .disabled(user.monthlySalary == 0)
                    }
                    
                }
                .cornerRadius(10)
                .padding(10)
                .frame(width: .infinity, height: 150)
                if user.monthlySalary == 0 {
                    Text("Input a monthly salary by clicking the Edit button").font(.title)
                }
                
                else if let newPrice = Double(price) {
                    let res = Compute(monthlySalary: user.monthlySalary, price: newPrice)
                    Text("\(res)")
                }
                
                // If the user hasn't provided a valid value yet
                else {
                    Text("Enter the price of the item above")
                }

                Spacer()
                Button(action: {
                    isFirstTimeUser = true
                    price = ""
                }) {
                    Text("Edit").font(.title)
                }
                .padding()

            }
            .padding()
            .toolbar {
                Button(action: {
                    clickedAbout = true
                }) {
                    Text("About")
                }
            }
            .sheet(isPresented: $isFirstTimeUser) {
                NavigationStack {
                    FirstTimeView(user: $user, isFirstTimeUser: $isFirstTimeUser)
                }
            }
            .sheet(isPresented: $clickedAbout) {
                NavigationStack {
                    AboutView(clickedAbout: $clickedAbout)
                }
            }
            
            .onChange(of: scenePhase) { phase in
                if phase == .inactive { saveAction() }
        }
        }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(user: .constant(User(name: "", monthlySalary: 0)), saveAction: {})
    }
}
