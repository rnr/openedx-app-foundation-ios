import Testing
import Foundation
@testable import OEXFoundation

//@Test func testInitWithISO8601() async throws {
//    let calendar = Calendar.current
//    let timeZoneUTC = TimeZone(abbreviation: "UTC")!
//    var utcCalendar = Calendar.current
//    utcCalendar.timeZone = timeZoneUTC
//
//    // Valid ISO8601 string without milliseconds
//    let iso8601String1 = "2023-10-09T12:34:56Z"
//    let expectedComponents1 = DateComponents(timeZone: timeZoneUTC, year: 2023, month: 10, day: 9, hour: 12, minute: 34, second: 56)
//    let date1 = Date(iso8601: iso8601String1)
//    let components1 = utcCalendar.dateComponents([.timeZone, .year, .month, .day, .hour, .minute, .second], from: date1)
//    #expect(components1 == expectedComponents1)
//
//    // Valid ISO8601 string with milliseconds
//    let iso8601String2 = "2023-10-09T12:34:56.789000Z"
//    let date2 = Date(iso8601: iso8601String2)
//    let components2 = utcCalendar.dateComponents([.timeZone, .year, .month, .day, .hour, .minute, .second], from: date2)
//    #expect(components2 == expectedComponents1) // Milliseconds are ignored in the implementation
//
//    // Invalid ISO8601 string
//    let invalidIso8601String = "invalid-date"
//    let date3 = Date(iso8601: invalidIso8601String)
//    let now = Date()
//    #expect(abs(date3.timeIntervalSince1970 - now.timeIntervalSince1970) < 1) // Defaults to current date
//}
//
//@Test func testTimeAgoDisplay() async throws {
//    let calendar = Calendar.current
//    let today = Date()
//    let dateToday = calendar.startOfDay(for: today)
//
//    // Test today
//    let date1 = dateToday
//    let result1 = date1.timeAgoDisplay()
//    #expect(result1 == OEXLocalization.Date.today)
//
//    // Test yesterday
//    let date2 = calendar.date(byAdding: .day, value: -1, to: dateToday)!
//    let result2 = date2.timeAgoDisplay()
//    #expect(result2 == OEXLocalization.yesterday)
//
//    // Test tomorrow
//    let date3 = calendar.date(byAdding: .day, value: 1, to: dateToday)!
//    let result3 = date3.timeAgoDisplay()
//    #expect(result3 == OEXLocalization.tomorrow)
//
//    // Test within next 7 days
//    let date4 = calendar.date(byAdding: .day, value: 3, to: dateToday)!
//    let result4 = date4.timeAgoDisplay()
//    let weekdayFormatter = DateFormatter()
//    weekdayFormatter.dateFormat = "EEEE"
//    let expectedWeekday = weekdayFormatter.string(from: date4)
//    #expect(result4 == expectedWeekday)
//
//    // Test within last 7 days
//    let date5 = calendar.date(byAdding: .day, value: -3, to: dateToday)!
//    let result5 = date5.timeAgoDisplay()
//    #expect(result5 == OEXLocalization.Date.daysAgo(3))
//
//    // Test beyond next 7 days
//    let date6 = calendar.date(byAdding: .day, value: 10, to: dateToday)!
//    let result6 = date6.timeAgoDisplay()
//    let isCurrentYear = calendar.component(.year, from: date6) == calendar.component(.year, from: dateToday)
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = isCurrentYear ? "MMMM d" : "MMMM d, yyyy"
//    let expectedDateString6 = dateFormatter.string(from: date6)
//    #expect(result6 == expectedDateString6)
//}
//
//@Test func testIsDateInNextWeek() async throws {
//    let calendar = Calendar.current
//    let currentDate = Date()
//    let dateInNextWeek = calendar.date(byAdding: .day, value: 9, to: currentDate)!
//    let result1 = dateInNextWeek.isDateInNextWeek(date: dateInNextWeek, currentDate: currentDate)
//    #expect(result1 == true)
//
//    let dateWithinNextWeek = calendar.date(byAdding: .day, value: 5, to: currentDate)!
//    let result2 = dateWithinNextWeek.isDateInNextWeek(date: dateWithinNextWeek, currentDate: currentDate)
//    #expect(result2 == false) // According to the method logic
//
//    // Adjusted test to match method logic
//    let nextWeekDate = calendar.date(byAdding: .weekOfYear, value: 1, to: currentDate)!
//    let dateInNextWeekRange = calendar.date(byAdding: .day, value: 2, to: nextWeekDate)!
//    let result3 = dateInNextWeekRange.isDateInNextWeek(date: dateInNextWeekRange, currentDate: currentDate)
//    #expect(result3 == true)
//}
//
//@Test func testInitWithSubtitleTime() async throws {
//    let calendar = Calendar.current
//    let now = Date()
//    let components = calendar.dateComponents([.year, .month, .day], from: now)
//    let subtitleTime = "12:34:56,789"
//
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss,SSS"
//    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
//    let dateString = "\(components.year!)-\(components.month!)-\(components.day!) \(subtitleTime)"
//    let expectedDate = dateFormatter.date(from: dateString)!
//
//    let date = Date(subtitleTime: subtitleTime)
//    #expect(date == expectedDate)
//}
//
//@Test func testInitWithMilliseconds() async throws {
//    let milliseconds: Double = 3661.789 * 1000 // 1 hour, 1 minute, 1 second, and 789 milliseconds
//    let date = Date(milliseconds: milliseconds)
//
//    let calendar = Calendar.current
//    let now = Date()
//    var components = calendar.dateComponents([.year, .month, .day], from: now)
//    components.hour = 1
//    components.minute = 1
//    components.second = 1
//    components.nanosecond = Int(0.789 * 1_000_000_000)
//
//    let expectedDate = calendar.date(from: components)!
//    #expect(abs(date.timeIntervalSince1970 - expectedDate.timeIntervalSince1970) < 1)
//}
//
//@Test func testSecondsSinceMidnight() async throws {
//    let calendar = Calendar.current
//    var components = calendar.dateComponents([.year, .month, .day], from: Date())
//    components.hour = 1
//    components.minute = 2
//    components.second = 3
//
//    let date = calendar.date(from: components)!
//    let seconds = date.secondsSinceMidnight()
//    #expect(seconds == 3723) // 1*3600 + 2*60 + 3 = 3600 + 120 + 3
//}
//
//@Test func testDateToString() async throws {
//    let calendar = Calendar.current
//    let date = calendar.date(from: DateComponents(year: 2023, month: 10, day: 9))!
//
//    // Test .courseStartsMonthDDYear style
//    let result1 = date.dateToString(style: .courseStartsMonthDDYear, useRelativeDates: false)
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateStyle = .medium
//    let expectedDate = dateFormatter.string(from: date)
//    #expect(result1 == OEXLocalization.Date.courseStarts + " " + expectedDate)
//
//    // Test .mmddyy style
//    let result2 = date.dateToString(style: .mmddyy, useRelativeDates: false)
//    dateFormatter.dateFormat = "dd.MM.yy"
//    let expectedDate2 = dateFormatter.string(from: date)
//    #expect(result2 == expectedDate2)
//
//    // Test with useRelativeDates = true
//    let today = Date()
//    let result3 = today.dateToString(style: .mmddyy, useRelativeDates: true)
//    #expect(result3 == OEXLocalization.Date.today)
//}
//
//@Test func testDateComparisons() async throws {
//    let date1 = Date()
//    let date2 = date1.addingTimeInterval(60) // date1 + 60 seconds
//
//    #expect(date1.isEarlierThanOrEqualTo(date: date2) == true)
//    #expect(date2.isEarlierThanOrEqualTo(date: date1) == false)
//
//    #expect(date2.isLaterThanOrEqualTo(date: date1) == true)
//    #expect(date1.isLaterThanOrEqualTo(date: date2) == false)
//
//    #expect(date1.isEarlierThanOrEqualTo(date: date1) == true)
//    #expect(date1.isLaterThanOrEqualTo(date: date1) == true)
//}
//
//@Test func testIsCurrentYear() async throws {
//    let date = Date()
//    #expect(date.isCurrentYear() == true)
//
//    var components = Calendar.current.dateComponents([.year, .month, .day], from: date)
//    components.year = components.year! - 1
//    let lastYearDate = Calendar.current.date(from: components)!
//
//    #expect(lastYearDate.isCurrentYear() == false)
//}
//
