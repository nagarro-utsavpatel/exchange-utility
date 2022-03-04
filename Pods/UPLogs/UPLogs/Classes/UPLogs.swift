//
//  UPLogs.swift
//  UPLogs
//
//  Created by erbittuu on 08/14/2020.
//  Copyright (c) 2020 erbittuu. All rights reserved.
//

import Foundation

/// logger main responsible class
///
/// ```
/// let simpleLog = UPLogs() // Or
/// let detailedLogs = UPLogs(formatter: .detailed)
/// simpleLog.trace("trace logs")
/// simpleLog.debug("Who is self:", self)
/// simpleLog.info("some", "objects", "here")
/// simpleLog.warning("one", "two", "three", separator: " - ")
/// simpleLog.error("error", terminator: "😱😱😱\n")
/// ```
open class UPLogs {
    /// The uplogs state.
    open var enabled: Bool = true

    /// The uplogs formatter.
    open var formatter: Formatter {
        didSet { formatter.uplogs = self }
    }

    /// The minimum level of severity.
    open var minLevel: Level

    /// The uplogs format.
    open var format: String {
        return formatter.description
    }

    /// The queue used for logging.
    private let queue = DispatchQueue(label: "uplogs.log")

    /**
     Creates and returns a new uplogs.
     
     - parameter formatter: The formatter.
     - parameter theme:     The theme.
     - parameter minLevel:  The minimum level of severity.
     
     - returns: A newly created uplogs.
     */
    public init(formatter: Formatter = .default, minLevel: Level = .trace) {
        self.formatter = formatter
        self.minLevel = minLevel

        formatter.uplogs = self
    }

    /**
     Logs a message with a trace severity level.
     
     - parameter items:      The items to log.
     - parameter separator:  The separator between the items.
     - parameter terminator: The terminator of the log message.
     - parameter file:       The file in which the log happens.
     - parameter line:       The line at which the log happens.
     - parameter column:     The column at which the log happens.
     - parameter function:   The function in which the log happens.
     */
    open func trace(_ items: Any..., separator: String = " ", terminator: String = "\n", file: String = #file, line: Int = #line, column: Int = #column, function: String = #function) {
        log(.trace, items, separator, terminator, file, line, column, function)
    }

    /**
     Logs a message with a debug severity level.
     
     - parameter items:      The items to log.
     - parameter separator:  The separator between the items.
     - parameter terminator: The terminator of the log message.
     - parameter file:       The file in which the log happens.
     - parameter line:       The line at which the log happens.
     - parameter column:     The column at which the log happens.
     - parameter function:   The function in which the log happens.
     */
    open func debug(_ items: Any..., separator: String = " ", terminator: String = "\n", file: String = #file, line: Int = #line, column: Int = #column, function: String = #function) {
        log(.debug, items, separator, terminator, file, line, column, function)
    }

    /**
     Logs a message with an info severity level.
     
     - parameter items:      The items to log.
     - parameter separator:  The separator between the items.
     - parameter terminator: The terminator of the log message.
     - parameter file:       The file in which the log happens.
     - parameter line:       The line at which the log happens.
     - parameter column:     The column at which the log happens.
     - parameter function:   The function in which the log happens.
     */
    open func info(_ items: Any..., separator: String = " ", terminator: String = "\n", file: String = #file, line: Int = #line, column: Int = #column, function: String = #function) {
        log(.info, items, separator, terminator, file, line, column, function)
    }

    /**
     Logs a message with a warning severity level.
     
     - parameter items:      The items to log.
     - parameter separator:  The separator between the items.
     - parameter terminator: The terminator of the log message.
     - parameter file:       The file in which the log happens.
     - parameter line:       The line at which the log happens.
     - parameter column:     The column at which the log happens.
     - parameter function:   The function in which the log happens.
     */
    open func warning(_ items: Any..., separator: String = " ", terminator: String = "\n", file: String = #file, line: Int = #line, column: Int = #column, function: String = #function) {
        log(.warning, items, separator, terminator, file, line, column, function)
    }

    /**
     Logs a message with an error severity level.
     
     - parameter items:      The items to log.
     - parameter separator:  The separator between the items.
     - parameter terminator: The terminator of the log message.
     - parameter file:       The file in which the log happens.
     - parameter line:       The line at which the log happens.
     - parameter column:     The column at which the log happens.
     - parameter function:   The function in which the log happens.
     */
    open func error(_ items: Any..., separator: String = " ", terminator: String = "\n", file: String = #file, line: Int = #line, column: Int = #column, function: String = #function) {
        log(.error, items, separator, terminator, file, line, column, function)
    }

    /**
     Logs a message.
     
     - parameter level:      The severity level.
     - parameter items:      The items to log.
     - parameter separator:  The separator between the items.
     - parameter terminator: The terminator of the log message.
     - parameter file:       The file in which the log happens.
     - parameter line:       The line at which the log happens.
     - parameter column:     The column at which the log happens.
     - parameter function:   The function in which the log happens.
     */
    private func log(_ level: Level, _ items: [Any], _ separator: String, _ terminator: String, _ file: String, _ line: Int, _ column: Int, _ function: String) {
        guard enabled && level >= minLevel else { return }

        let date = Date()

        let result = formatter.format(
            level: level,
            items: items,
            separator: separator,
            terminator: terminator,
            file: file,
            line: line,
            column: column,
            function: function,
            date: date
        )

        queue.async {
            Swift.print(result, separator: "", terminator: "")
        }
    }
}
