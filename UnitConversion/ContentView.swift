//
//  ContentView.swift
//  UnitConversion
//
//  Created by SCOTT CROWDER on 10/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var startingValue: Double = 0
    @State private var startingUnitType: String = "Inches"
    @State private var outputUnitType: String = "Centimeters"
    
    let startingUnitTypes: [String] = ["Inches", "Feet", "Miles", ]
    let outputUnitTypes: [String] = ["Centimeters", "Meters", "Kilometers"]
    
    var output: Double {
        
        var inches: Double
        let inchesInFeet: Double = 12
        let feetInMiles: Double = 5080
        let inchesInMiles: Double = inchesInFeet * feetInMiles
        
        var centimeters: Double = 2.54
        let centimetersInMeters: Double = 100
        let metersInKilometers: Double = 1000
        let centimetersInKilometers: Double = centimetersInMeters * metersInKilometers
        
        let outputValue: Double
        
        if startingUnitType == "Feet" {
            inches = startingValue * inchesInFeet
        } else if startingUnitType == "Miles" {
            inches = startingValue / inchesInMiles
        } else {
            inches = startingValue
        }
        
        if outputUnitType == "Meters" {
            outputValue = inches * centimeters / centimetersInMeters
        } else if outputUnitType == "Kilometers" {
            outputValue = inches * centimeters / centimetersInKilometers
        } else {
            outputValue = inches * centimeters
        }
        
        return outputValue
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Starting Value") {
                    TextField("Starting Value", value: $startingValue, format:.number)
                        .keyboardType(.numberPad)
                }
                
                Section("Starting to Unit") {
                    Picker("Starting Unit", selection: $startingUnitType) {
                        ForEach(startingUnitTypes, id:\.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Output Unit") {
                    Picker("Output Unit", selection: $outputUnitType) {
                        ForEach(outputUnitTypes, id:\.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Output") {
                    Text(output, format: .number)
                }
            }
            .navigationTitle("Unit Conversion")
        }
    }
}

#Preview {
    ContentView()
}
