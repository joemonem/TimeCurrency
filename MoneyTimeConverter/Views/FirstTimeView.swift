//
//  FirstTimeView.swift
//  MoneyTimeConverter
//
//  Created by Joe Monem on 03/10/2023.
//

import SwiftUI

struct FirstTimeView: View {
    @Binding var user: User
    @State private var newUserName = ""
    @State private var newUserMonthlySalary = ""
    @Binding var isFirstTimeUser: Bool



    var body: some View {
        
            VStack {
                Text("Dollars to Time").font(.title).padding()
            List {
                Section(header: Text("Meeting Info")) {
                    TextField("Name", text: $newUserName)
                    TextField("Monthly Salary", text: $newUserMonthlySalary)
                }
            }
            .cornerRadius(16)
            .frame(height: 200)
            .padding()
                NavigationLink {
                    ContentView(user: $user, saveAction: {})
                } label: {
                    Button("Get Started") {
                        user.name = newUserName
                        user.monthlySalary = Int(newUserMonthlySalary)!
                        isFirstTimeUser = false
                    }
                    .disabled(newUserMonthlySalary.isEmpty || Int(newUserMonthlySalary) == nil || newUserName.isEmpty)
                }
                Spacer()
            }
        
        

        
    }
}

struct FirstTimeView_Previews: PreviewProvider {
    static var previews: some View {
        FirstTimeView(user: .constant(User.sampleUser), isFirstTimeUser: .constant(false))
        
    }
}
