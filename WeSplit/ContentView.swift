//
//  ContentView.swift
//  WeSplit
//
//  Created by Aaron Thompson on 09/04/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var cost: Double = 0
    @State private var numberOfPeople = 0
    @State private var tipPercent: Int = 20
    
    @FocusState private var amountInFocus: Bool
    
    
    var totalAmount: Double {
        let tipSelection = Double (tipPercent)
        let amount = Double(cost)
    
        let tipValue = amount / 100 * tipSelection
        let grandTotal = amount + tipValue
        
        return grandTotal
    }
    
    var totalPerPerson: Double {
        let tipSelection = Double (tipPercent)
        let amount = Double(cost)
    
        let tipValue = amount / 100 * tipSelection
        let grandTotal = amount + tipValue
        let amountPerPerson = grandTotal / Double(numberOfPeople)
        
        return amountPerPerson
        
    }
    
  
    
    var body: some View {
        
        NavigationView{
            
            Form{
                
                Section{
                    TextField("\(cost)", value: $cost, format: .currency(code: "GBP")).keyboardType(.decimalPad).focused($amountInFocus)
                    
                    Picker("Tip percentage", selection: $tipPercent){
                        ForEach(0..<101, id: \.self){
                            Text($0, format: .percent)
                        }}
                }
                
                
                Section{
                    Picker("Number of People", selection: $numberOfPeople){
                        ForEach(1...20, id: \.self){
                            Text($0, format: .number)
                        }}
                }
                

                Section(header: Text("Total amount") ){
                    Text(totalAmount, format: .currency (code:
                    Locale.current.currency?.identifier ?? "GBP"))
                }.foregroundStyle(tipPercent == 0 ? .red : .black)
                
                
                Section(header: Text("Amount per person")){
                    Text (totalPerPerson, format: .currency (code:
                    Locale.current.currency?.identifier ?? "GBP"))
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
