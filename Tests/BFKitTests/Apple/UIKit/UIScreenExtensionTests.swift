//
//  UIScreenExtensionTests.swift
//  BFKit-Swift
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2018 Fabrizio Brancati.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

@testable import BFKit
import Foundation
import UIKit
import XCTest

internal class UIScreenExtensionTests: XCTestCase {
    internal func testScreenWidth() {
        XCTAssertGreaterThan(UIScreen.screenWidth, 350)
    }
    
    internal func testScreenHeight() {
        XCTAssertGreaterThan(UIScreen.screenHeight, 700)
    }
    
    internal func testMaxScreenLength() {
        XCTAssertGreaterThan(UIScreen.screenHeight, 700)
    }
    
    internal func testMinScreenLength() {
        XCTAssertGreaterThan(UIScreen.screenWidth, 350)
    }
    
    internal func testIsRetina() {
        XCTAssertFalse(UIScreen.isRetina())
    }
    
    internal func testIsRetinaHD() {
        XCTAssertTrue(UIScreen.isRetinaHD())
    }
    
    internal func testFixedScreenSize() {
        XCTAssertGreaterThan(UIScreen.fixedScreenSize().width, 350)
        XCTAssertGreaterThan(UIScreen.fixedScreenSize().height, 700)
    }
}
