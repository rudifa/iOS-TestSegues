//
//  PrintDeltaTimeTests.swift
//  TestSeguesTests
//
//  Created by Rudolf Farkas on 06.01.23.
//  Copyright © 2023 Rudolf Farkas. All rights reserved.
//

import XCTest

import Foundation

struct TimerDeltaSigma {
    enum Format: String {
        case s
        case ms
        case μs
    }

    private var initialTime: Date?
    private var previousTime: Date?

    typealias Elapsed = (delta: TimeInterval, sigma: TimeInterval)

    mutating func elapsedTimes() -> Elapsed {
        let currentTime = Date()

        if let initialTime = initialTime, let previousTime = previousTime {
            let sigmaTime = currentTime.timeIntervalSince(initialTime)
            let deltaTime = currentTime.timeIntervalSince(previousTime)
            self.previousTime = currentTime
            return (delta: deltaTime, sigma: sigmaTime)
        } else {
            initialTime = currentTime
            previousTime = currentTime
            return (delta: 0, sigma: 0)
        }
    }

    private func format(_ times: Elapsed, fmt: Format) -> String {
        switch fmt {
        case .s:
            return String(format: "Δ %.0f, Σ %.0f s", times.delta, times.sigma)
        case .ms:
            return String(format: "Δ %.3f, Σ %.3f s", times.delta, times.sigma)
        case .μs:
            return String(format: "Δ %.6f, Σ %.6f s", times.delta, times.sigma)
        }
    }

    mutating func printElapsedTimes(_ fmt: Format = .μs) {
        print(format(elapsedTimes(), fmt: fmt))
    }
}

final class PrintDeltaTimeTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func test_Timer() {
        struct Timer {
            enum Mode: String {
                case delta
                case sigma
            }

            let mode: Mode
            private var previousTime: Date?

            init(_ mode: Mode) {
                self.mode = mode
            }

            mutating func printElapsedTime() {
                let currentTime = Date()

                if let previousTime = previousTime {
                    let elapsedTime = currentTime.timeIntervalSince(previousTime)
                    print(format(elapsedTime))
                    if mode == .delta {
                        self.previousTime = currentTime
                    }
                } else {
                    print(format(0))
                    previousTime = currentTime
                }
            }

            private func format(_ elapsedTime: TimeInterval) -> String {
                let str = String(format: "%.6f", elapsedTime)
                return "\(mode): \(str) seconds"
            }
        }

        var sigma = Timer(.sigma)
        for _ in 0 ..< 10 {
            sigma.printElapsedTime()
        }

        var delta = Timer(.delta)
        for _ in 0 ..< 10 {
            delta.printElapsedTime()
        }
    }

    func test_TimerDeltaSigma() {
        var tds = TimerDeltaSigma()
        for _ in 0 ..< 10 {
            tds.printElapsedTimes()
        }
        print()
        for _ in 0 ..< 5 {
            tds.printElapsedTimes(.ms)
        }
        print()
        for _ in 0 ..< 5 {
            tds.printElapsedTimes(.s)
        }
        print()
    }
}
