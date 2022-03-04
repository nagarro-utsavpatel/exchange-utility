//
//  Level.swift
//  UPLogs
//
//  Created by erbittuu on 08/14/2020.
//  Copyright (c) 2020 erbittuu. All rights reserved.
//

import Foundation

///Level: Logging Levels
public enum Level: Int {
    /// Commonly used in development
    case trace
    /// Commonly used while debugging app
    case debug
    /// Info purpose, Should not use in debug or error
    case info
    /// If any warning needs to print
    case warning
    /// Use only if we want to show breakable error, or blocker error
    case error
    
    var description: String {
        return String(describing: self).uppercased()
    }
}

extension Level: Comparable {
    public static func < (lhs: Level, rhs: Level) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
