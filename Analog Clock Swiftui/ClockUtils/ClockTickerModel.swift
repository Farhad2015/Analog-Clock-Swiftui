//
//  ClockTickerModel.swift
//  Analog Clock Swiftui
//
//  Created by Mahmudur Rahman on 3/4/22.
//

import SwiftUI
import Combine

struct ClockTickerModel {
    enum TickerType {
        case second
        case hour
        case minute
    }
    
    let type: TickerType
    let timeInterval: TimeInterval
    let tickScale: CGFloat
    
    var angleMultiplier: CGFloat {
        switch type{
        case .second:
            return CGFloat(self.timeInterval.remainder(dividingBy: 60)) / 60
        case .minute:
            return CGFloat((timeInterval - Double(Int(timeInterval / 3600) * 3600)) / 60) / 60
        case .hour:
            return CGFloat(timeInterval / 3600) / 12
        }
    }
    
    var tickerScale: CGFloat {
            switch type {
            case .second:
                return 0.8
            case .hour:
                return 0.4
            case .minute:
                return 0.6
            }
        }
}
