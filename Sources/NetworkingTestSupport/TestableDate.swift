import Foundation

public enum TestableDate {
    public static var testReferenceDate: Date?

     public static func now() -> Date {
        guard let testDate = testReferenceDate else {
            return Date()
        }

        return testDate
    }
}
