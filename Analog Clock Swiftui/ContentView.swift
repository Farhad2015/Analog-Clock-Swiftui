//
//  ContentView.swift
//  Analog Clock Swiftui
//
//  Created by Mahmudur Rahman on 3/4/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var time = CurrentTime()
    
    var body: some View {
        ZStack {
            VStack {
                Text("\(time.seconds)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
