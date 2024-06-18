//
//  ContentView.swift
//  WeSplit
//
//  Created by Aaron Thompson on 09/04/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var cost: Double = 0
    @State var numberOfPeople = 0
    @State var tipPercent: Int = 20
    
    @FocusState private var amountInFocus: Bool
    
    let percentages = [5, 10, 15, 20, 0]
    
  
    
    var body: some View {
        
        NavigationView{
            Form{
                
                
                Section{
                    TextField("\(cost)", value: $cost, format: .currency(code: "GBP")).keyboardType(.decimalPad).focused($amountInFocus)
                    
                    TextField("Number of people", value: $numberOfPeople, format: .number).keyboardType(.numberPad)
                }
                
                

                
                Section{
                    
                    Picker("Tip percentage", selection: $tipPercent){
                        ForEach(percentages, id: \.self){
                            Text($0, format: .percent)
                        }
                    }.pickerStyle(.segmented)
                }
                
                Section{
                    
                    Text("Each person owes \(  Double( (cost / 100 * Double(tipPercent)) + cost )  / Double(numberOfPeople) )")
                }
                
            }.navigationTitle("WeSplit")
                .toolbar{ if amountInFocus {
                    Button("Done"){
                        amountInFocus = false
                    }
                }}
        }
        
    }
}

#Preview {
    ContentView()
}
