//
//  DatePickers.swift
//  BetterRest
//
//  Created by Apprenant 86 on 21/11/2021.
//

import SwiftUI

struct DatePickers: View {
    
    @State private var wakeUp = Date.now
    
    @State private var wakeUp2 = Date.now
    @State private var wakeUp3 = Date.now
    
    var body: some View {
        VStack {
            
            // basic date picker:
            DatePicker("Please enter a date:", selection: $wakeUp)
            
            // Do not try to erase label like that:
            DatePicker("", selection: $wakeUp)
            // this will prevent screen reader to work (VoiceOver)
            
            // Do it like that:
            DatePicker("Please enter a date:", selection: $wakeUp)
                .labelsHidden()
            
            // showing only one component of a date:
            DatePicker("Please enter a date:", selection: $wakeUp, displayedComponents: .hourAndMinute)
            
            DatePicker("Please enter a date:", selection: $wakeUp, displayedComponents: .date)
            
            // with a one-sided range:
            DatePicker("Please enter a date", selection: $wakeUp2, in: Date.now...)
            
            DatePicker("Pease enter a date:", selection: $wakeUp3, in: ...Date.now)
        }
    }
    
    func exampleDates() -> ClosedRange<Date> {
        // create a second Date instance set to one day in seconds from now
        let tomorrow = Date.now.addingTimeInterval(86400)

        // create a range from those two
        let range = Date.now...tomorrow
        
        return range
    }
}

struct DatePickers_Previews: PreviewProvider {
    static var previews: some View {
        DatePickers()
    }
}
