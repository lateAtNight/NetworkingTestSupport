#if os(iOS)
import Foundation
import os.log

extension OSLog {
    private static var subsystem = Bundle.main.bundleIdentifier!
    public static let testSupport = OSLog(subsystem: subsystem, category: "testSupport")
}
#endif
