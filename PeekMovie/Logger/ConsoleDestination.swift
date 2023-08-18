//
//  ConsoleDestination.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 18.08.2023.
//

import Foundation

// MARK: - Format

/// Default console destination that print log strings.
public final class ConsoleDestination: LoggerDestinationProtocol {

    // MARK: Expsoed properties

    public var outputLevel: LogLevel = .verbose

    public init() {

    }

    // MARK: Exposed methods

    public func process(string: String, level: LogLevel) {
        #if DEBUG
        print(string)
        #endif
    }

}
