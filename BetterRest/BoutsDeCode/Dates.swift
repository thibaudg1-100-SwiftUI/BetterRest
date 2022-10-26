//
//  Dates.swift
//  BetterRest
//
//  Created by Apprenant 86 on 21/11/2021.
//

import SwiftUI

struct Dates: View {
    var body: some View {
        VStack {
            //diferent ways to display dates:
            Text(Date.now, format: .dateTime.hour().minute())
            Text(Date.now, format: .dateTime.day().month().year()) // notice that the displayed date doesn't follow the format pattern, but the system pattern (locale)
            
            Text(Date.now.formatted(date: .long, time: .shortened))
            
            Text(Date.now.formatted(date: .long, time: .omitted))
        }
    }
    
    // Dates are hard:
    func trivialExample() -> ClosedRange<Date> {
        let now = Date.now
        // adding 86400 seconds to now to get the same time tomorrow:
        let tomorrow = Date.now.addingTimeInterval(86400)
        // but this is not 100% correct because of leap seconds, daylight saving and other Gregorian calendar related issues
        let range = now...tomorrow
        // it's better to use Apple framework to handle dates
        
        return range // just to avoid useless warning on not-used let containers
    }
    
    func anotherExample() -> Date {
        var components = DateComponents() // every property set to nil at creation
        components.hour = 23
        components.minute = 59
        let date = Calendar.current.date(from: components) ?? Date.now
        // use nil coalescing because date(from:) returns a Date? because Dates are hard !!!
        // date(from:) tries to create a Date out of a DateComponents in the current Calendar
        
        return date
    }
    
    func anExample() -> (Int, Int) {
        let components = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
        // dateComponents provides a DateComponents out of a Date and with only the specified set of properties/components
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        // remember: all DateComponents properties are optionals
        
        return (hour, minute)
    }
}

struct Dates_Previews: PreviewProvider {
    static var previews: some View {
        Dates()
    }
}
