//
//  ContentView.swift
//  Project 1- Check-Splitting App
//
//  Created by Neves on 13/08/2020.
//  Copyright © 2020 Neves. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedStudent = 0
    @State private var tipping = 2
    @State private var numberOfPersonsIndex = 0
    @State private var payAmount = ""
    @State private var splittedPayAmount = ""
    
    let tippingArray = [0,5,10,15,20]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Section {
                    
                    Text("Amount:")
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                        .padding()
                    TextField("Input amount to split", text: $payAmount)
                        .padding(.horizontal, 25.0)
                        .keyboardType(.decimalPad)
                    
                    
                    
                    
                    
                    Text("Number of persons:")
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                        .padding(.leading)
                    
                    
                    Picker("", selection: $numberOfPersonsIndex) {
                        ForEach(2 ..< 10) {
                            Text("\($0)")
                        }
                    }.padding(.horizontal, 25.0).pickerStyle(SegmentedPickerStyle())
                    
                    
                    
                    
                    Text("Tipping percentage:")
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                        .padding(.leading)
                    
                    Picker("", selection: $tipping) {
                        ForEach(0 ..< tippingArray.count) {
                            Text("\(self.tippingArray[$0])")
                        }
                    }.padding(.horizontal, 25.0).pickerStyle(SegmentedPickerStyle())
                    
                    
                }.padding(5.0).navigationBarTitle("We Split", displayMode: .large)
                
                
                Spacer()
                HStack {
                    Spacer()
                    if payAmount != "" {
                        Text("\(calculateSplittedAmount(totalAmount: payAmount, numberOfPersons: numberOfPersonsIndex, tippingPercentage: tippingArray[tipping]), specifier: "%.2f") $ per person")
                            .font(.title)
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                    Spacer()
                }
                .padding()
                
                
                
            }
            .padding([.top, .leading, .trailing], 5.0)
        }
        
        
        
    }
}

func calculateSplittedAmount(totalAmount: String, numberOfPersons: Int, tippingPercentage: Int) -> (Double) {
    
    if let totalAmountDouble = Double(totalAmount) {
        
        let totalAmountDouble = totalAmountDouble + totalAmountDouble * (Double(tippingPercentage) / 100)
        
        return totalAmountDouble / Double(numberOfPersons + 2)
    }
    
    return 0
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
