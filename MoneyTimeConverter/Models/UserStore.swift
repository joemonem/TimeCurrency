//
//  DataStore.swift
//  MoneyTimeConverter
//
//  Created by Joe Monem on 03/10/2023.
//

import SwiftUI

@MainActor
class UserStore: ObservableObject {
    @Published var user: User = User(name: "", monthlySalary: 0)
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("user.data")
    }
    
    func load() async throws {
        let task = Task<User, Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                // If we couldn't load the user's data, it means that it's a first time user
                //TODO: Add a view for first time users
                return User(name: "", monthlySalary: 0)
            }
            let dailyScrums = try JSONDecoder().decode(User.self, from: data)
            return dailyScrums
        }
        let user = try await task.value
        self.user = user
    }
    
    func save(user: User) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(user)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}
