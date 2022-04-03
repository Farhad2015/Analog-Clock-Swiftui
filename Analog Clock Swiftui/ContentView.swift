//
//  ContentView.swift
//  Analog Clock Swiftui
//
//  Created by Mahmudur Rahman on 3/4/22.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var time = CurrentTime()
    
    func tick(at tick: Int) -> some View {
                   VStack {
                       Rectangle()
                           .fill(Color.primary)
                           .opacity(tick % 5 == 0 ? 1 : 0.4)
                           .frame(width: 2, height: tick % 5 == 0 ? 15 : 7)
                       Spacer()
               }.rotationEffect(Angle.degrees(Double(tick)/(60) * 360))
        }
    
    var body: some View {
        ZStack {
            
            ForEach(0..<60) { tick in
                            self.tick(at: tick)
                        }
                        GeometryReader { geometry in
                            ZStack {
                                HStack {
                                    Text("9")
                                        .padding(.leading)
                                    Spacer()
                                    Text("3")
                                        .padding(.trailing)
                                    EmptyView()
                                }
                                VStack {
                                    EmptyView()
                                    Text("12")
                                        .padding(.top)
                                    Spacer()
                                    Text("6")
                                        .padding(.bottom)
                                    EmptyView()
                                }
                            }.frame(width: geometry.size.width - 30, height: geometry.size.height - 30, alignment: .center)
                                .padding()
                        }
            
            Clock(model: .init(type: .hour, timeInterval: time.seconds, tickScale: 0.4))
                .stroke(Color.primary, style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle.degrees(360/60))
            
            Clock(model: .init(type: .minute, timeInterval: time.seconds, tickScale: 0.6))
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle.degrees(360/60))
            
            Clock(model: .init(type: .second, timeInterval: time.seconds, tickScale: 0.8))
                .stroke(Color.red, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle.degrees(360/60))
        }.frame(width: 300, height: 300, alignment: .center)
            
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
