//
//  ContentView.swift
//  WeSplit
//
//  Created by Aaron Thompson on 09/04/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var name = "Aaron"
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Text(name)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
