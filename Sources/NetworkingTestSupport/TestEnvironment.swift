import Foundation

public enum TestEnvironment {
    public enum SessionConfig {
        public static let key = "TEST_URL_SESSION_CONFIG"
    }
    public  enum Date {
        public  static let key = "TEST_REFERENCE_DATE"
        public  static let format = "yyyy-MM-dd'T'HH:mm:ss"
    }
}
