import Foundation
import os

// Container for logic applying to the test support infrastructure
public enum TestSystem {

    public static var testURLSession: URLSession?

    // Call `begin` at the start of `applicationDidFinishLoading` to initialise test support
    public static func begin() {
        let env = ProcessInfo.processInfo.environment

        if let testURLStubSetting = env[TestEnvironment.SessionConfig.key] {
            let config = TestURLSessionConfiguration(environmentVariable: testURLStubSetting)
            testURLSession = TestURLSession(testMapping: config)
        }

        if let testReferenceDateSetting = env[TestEnvironment.Date.key] {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.dateFormat = TestEnvironment.Date.format

            TestableDate.testReferenceDate = formatter.date(from: testReferenceDateSetting)
        }
    }

    public static func environmentRepresentation(forTestReferenceDate date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = TestEnvironment.Date.format

        return formatter.string(from: date)
    }
}
