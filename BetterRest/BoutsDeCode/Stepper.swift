//
//  Stepper.swift
//  BetterRest
//
//  Created by Apprenant 86 on 21/11/2021.
//

import SwiftUI

struct Steppers: View {
    
    // declare a @State variable that will change when used with a Stepper
    @State private var sleepAmount = 9.0
    
    @State private var sleepAmount2 = 9.0
    
    var body: some View {
        VStack {
            // basic stepper:
            Stepper("\(sleepAmount) hours", value: $sleepAmount)
            
            // refinded stepper
            Stepper("\(sleepAmount2.formatted()) hours", value: $sleepAmount2, in: 4...12, step: 0.25)
            // double value is formated to look nice, range and step are sensible
        }
    }
}

struct Steppers_Previews: PreviewProvider {
    static var previews: some View {
        Steppers()
    }
}
