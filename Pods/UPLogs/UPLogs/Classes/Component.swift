//
//  Component.swift
//  UPLogs
//
//  Created by erbittuu on 08/14/2020.
//  Copyright (c) 2020 erbittuu. All rights reserved.
//

import Foundation

/// Components of logging output, Helpful to create customize logging output as per need
///
public enum Component {
    /// log date with time in detail
    case date(String)
    /// logger message that user want to print
    case message
    /// logging level
    case level
    /// log file in which logger function called
    case file(fullPath: Bool, fileExtension: Bool)
    /// log function line number from source code
    case line
    /// log function column number from source code
    case column
    /// log function's parent function
    case function
    /// log location in code
    case location
}
