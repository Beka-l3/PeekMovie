//
//  LogDestinationProtocol.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 18.08.2023.
//

import Foundation

// MARK: - Destination

/// Interface for logger destination.
public protocol LoggerDestinationProtocol {

    // MARK: Properties

    /// Log level at after which a destination accepts messages.
    var outputLevel: LogLevel { get set }

    // MARK: Methods

    /// Sends a log message to the destination.
    func process(string: String, level: LogLevel)

}
