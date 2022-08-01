//
//  ConfigTests.swift
//  StreamingAppTests
//
//  Created by FGX on 2022/08/01.
//

import XCTest

class ConfigTests: XCTestCase {
    func testEventEndpointConfiguration() {
       if let eventEndpoint = Bundle.main.infoDictionary?["EVENT_ENDPOINT"] as? String {
           XCTAssertEqual("us-central1-dazn-sandbox.cloudfunctions.net/getEvents", eventEndpoint)
       }
   }
  func testScheduleEndpointConfiguration() {
       if let scheduleEndpoint = Bundle.main.infoDictionary?["SCHEDULE_ENDPOINT"] as? String {
           XCTAssertEqual("us-central1-daznsandbox.cloudfunctions.net/getSchedule", scheduleEndpoint)
       }
   }
}
