//
//  ContentView.swift
//  Memorize
//
//  Created by Alexandra Harley on 5/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 3)
            Text("Hello World")
                .foregroundColor(.orange)
                .padding()
        }
        .padding(.horizontal)
        .foregroundColor(.red)
        
        
    }
}



















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
