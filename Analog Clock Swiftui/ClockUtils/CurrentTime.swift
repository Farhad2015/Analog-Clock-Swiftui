//
//  CurrentTime.swift
//  Analog Clock Swiftui
//
//  Created by Mahmudur Rahman on 3/4/22.
//
//  ObservableObject with Timer to update UI every Second

import Foundation
import Combine

final class CurrentTime: ObservableObject {
    @Published var seconds: TimeInterval = CurrentTime.currentSecond(date: Date())
    
    private let timer = Timer.publish(every: 0.05, on: .main, in: .default).autoconnect()
    private var store = Set<AnyCancellable>()
    
    init(){
        timer.map(Self.currentSecond).assign(to: \.seconds, on: self).store(in: &store)
    }
    
    private static func currentSecond(date: Date) -> TimeInterval {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: date)
        let referenceDate = Calendar.current.date(from: DateComponents(year: components.year!, month: components.month!, day: components.day!))!
        return Date().timeIntervalSince(referenceDate)
    }
}
