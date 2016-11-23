//
//  UIDeviceExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 31/10/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
@testable import BFKit

class UIDeviceExtensionTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testOsVersionEqual() {
        let osVersion = osVersionEqual("10.1")
        
        XCTAssert(osVersion)
    }
    
    func testOsVersionGreater() {
        let osVersion = osVersionGreaterThan("9.2")
        
        XCTAssert(osVersion)
    }
    
    func testOsVersionGreaterOrEqual() {
        let osVersion = osVersionGreaterThanOrEqual("9.2")
        
        XCTAssert(osVersion)
    }
    
    func testOsVersionLess() {
        let osVersion = osVersionLessThan("11.0")
        
        XCTAssert(osVersion)
    }
    
    func testOsVersionLessOrEqual() {
        let osVersion = osVersionLessThanOrEqual("11.0")
        
        XCTAssert(osVersion)
    }
    
    func testOsVersion() {
        let osVersion = UIDevice.osVersion
        
        XCTAssert(osVersion == "10.1")
    }
    
    func testOsMajorVersion() {
        let osVersion = UIDevice.osMajorVersion
        
        XCTAssert(osVersion == 10)
    }
    
    func testHardwareModel() {
        let model = UIDevice.hardwareModel
        
        XCTAssert(model == "i386" || model == "x86_64")
    }
    
    func testDetailedModel() {
        let model = UIDevice.detailedModel
        
        XCTAssert(model == "Simulator")
    }
    
    func testCPUFrequency() {
        let frequency = UIDevice.cpuFrequency
        
        XCTAssert(frequency != 0)
    }
    
    func testBUSFrequency() {
        let frequency = UIDevice.busFrequency
        
        XCTAssert(frequency != 0)
    }
    
    func testRamSize() {
        let ramSize = UIDevice.ramSize
        
        XCTAssert(ramSize != 0)
    }
    
    func testCPUSNumber() {
        let cpusNumber = UIDevice.cpusNumber
        
        XCTAssert(cpusNumber != 0)
    }
    
    func testTotalMemory() {
        let totalMemory = UIDevice.totalMemory
        
        XCTAssert(totalMemory != 0)
    }
    
    func testUserMemory() {
        let userMemory = UIDevice.userMemory
        
        XCTAssert(userMemory != 0)
    }
    
    @available(iOS 9.0, *)
    func testIsLowPowerModeEnabled() {
        let isLowPowerMode = UIDevice.isLowPowerModeEnabled
        
        XCTAssertFalse(isLowPowerMode)
    }
    
    @available(iOS 9.0, *)
    func testLowPowerModeChanged() {
        let testExpectation = expectation(description: "Low Power Mode Changed")
        
        UIDevice.lowPowerModeChanged { isLowPowerModeEnabled in
            XCTAssertFalse(isLowPowerModeEnabled)
            
            testExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Something went horribly wrong.")
        })
    }
    
    func testIsPhone() {
        let device = UIDevice.isPhone()
        
        XCTAssertFalse(device)
    }
    
    func testIsPad() {
        let device = UIDevice.isPad()
        
        XCTAssertFalse(device)
    }
    
    func testIsPod() {
        let device = UIDevice.isPod()
        
        XCTAssertFalse(device)
    }
    
    func testIsTV() {
        let device = UIDevice.isTV()
        
        XCTAssertFalse(device)
    }
    
    func testIsWatch() {
        let device = UIDevice.isWatch()
        
        XCTAssertFalse(device)
    }
    
    func testIsSimulator() {
        let device = UIDevice.isSimulator()
        
        XCTAssertTrue(device)
    }
    
    func testTotalDiskSpace() {
        let totalDiskSpace = UIDevice.totalDiskSpace()
        
        XCTAssert(totalDiskSpace != 0.0)
    }
    
    func testFreeDiskSpace() {
        let freeDiskSpace = UIDevice.freeDiskSpace()
        
        XCTAssert(freeDiskSpace != 0.0)
    }
    
    func testGenerateUniqueIdentifier() {
        let uuid = UIDevice.generateUniqueIdentifier()
        
        print("UUID: \(uuid)")
        
        XCTAssert(uuid.length == 36)
    }
    
    func testSaveAPNSIdentifier() {
        let testExpectation = expectation(description: "Save APNS Identifier")
        let uuid = UIDevice.generateUniqueIdentifier()
        
        UIDevice.saveAPNSIdentifier(uuid, completion: { isValid, needsUpdate, savedUUID, newUUID in
            XCTAssertTrue(isValid)
            XCTAssertTrue(needsUpdate)
            XCTAssertNotNil(newUUID)
            
            testExpectation.fulfill()
        })
        
        waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Something went horribly wrong.")
        })
    }
}
