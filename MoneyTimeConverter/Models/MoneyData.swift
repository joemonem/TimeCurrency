//
//  MoneyData.swift
//  MoneyTimeConverter
//
//  Created by Joe Monem on 03/10/2023.
//

import Foundation

struct User: Identifiable, Codable {
    let id: UUID
    var name: String
    var monthlySalary: Int

    init(id: UUID = UUID(), name: String, monthlySalary: Int) {
        self.id = id
        self.name = name
        self.monthlySalary = monthlySalary
    }
    
}
extension User {
    static let sampleUser: User = User(name: "Joe", monthlySalary: 2_000)
}

// Displays the amount of work hours required to purchase the item
func Compute(monthlySalary: Int, price: Double) -> String {
    
    // Compute hourly rate
    let hourlyRate = Double(monthlySalary) / 160.0
    
    // The time it takes is the price of the item divided by the hourly rate
    let timePrice = price / hourlyRate
    
    let hour = Int(timePrice)
    let minutes = Int((timePrice - Double(hour)) * 60)
    
    // ContentView got too messy with all these conditions, better off putting them here and returning a string
    // Cases:
    // 0 hours and multiple minutes
    if hour == 0 && minutes > 1 {
        return "\(minutes) minutes"
    }
    
    // 0 hours and one minute
    if hour == 0 && minutes == 1 {
        return "\(minutes) minute"
    }
    
    // 1 hour and multiple minutes
    if hour == 1 && minutes > 1 {
        return "\(hour) hour and \(minutes) minutes"
    }
    
    // 1 hour and one minute
    if hour == 1 && minutes == 1 {
        return "\(hour) hour and \(minutes) minute"
    }
    
    // 1 hour and 0 minutes
    if hour == 1 && minutes == 0 {
        return "\(hour) hour"
    }
    
    
    // Multiples hours and multiple minutes
    if hour > 1 && minutes > 1 {
        return "\(hour) hours and \(minutes) minutes"
    }
    
    // Multiples hours and one minute
    if hour > 1 && minutes == 1 {
        return "\(hour) hours and \(minutes) minute"
    }
    
    // Multiples hours and 0 minutes
    if hour > 1 && minutes == 0 {
        return "\(hour) hours"
    }
    return ""
}

