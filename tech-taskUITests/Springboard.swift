import XCTest
import Foundation

class Springboard {
    
    let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
    //let settings = XCUIApplication(bundleIdentifier: "come.apple.Preferences")

    func deleteApp() {
        XCUIApplication().terminate()
        springboard.activate()

        let icon = springboard.icons["tech-task"]
        if icon.exists {
            let iconFrame = icon.frame
            let springboardFrame = springboard.frame
            icon.press(forDuration: 2.5)

            springboard.coordinate(withNormalizedOffset: CGVector(dx: ((iconFrame.minX + 3) / springboardFrame.maxX), dy:((iconFrame.minY + 3) / springboardFrame.maxY))).tap()

            Thread.sleep(forTimeInterval: 0.5)

            //springboard.alerts.buttons["Delete"].firstMatch.tap()
            springboard.alerts.buttons["Delete"].firstMatch.tap()

            // Press home once make the icons stop wiggling
            XCUIDevice.shared.press(.home)
            // Press home again to go to the first page of the springboard
            XCUIDevice.shared.press(.home)
            // Wait some time for the animation end
            Thread.sleep(forTimeInterval: 0.5)
        }
    }

    func resetLocationSettings() {

        let settingsIcon = springboard.icons["Settings"]
        if settingsIcon.exists {
            XCUIDevice.shared.press(.home)
            Thread.sleep(forTimeInterval: 2)
            settingsIcon.tap()
            let settings = XCUIApplication(bundleIdentifier: "com.apple.Preferences")
            settings.staticTexts["General"].tap()
            settings.tables.staticTexts["Reset"].tap()
            settings.tables.staticTexts["Reset Location & Privacy"].tap()
            settings.scrollViews.buttons["Reset Warnings"].tap()
            settings.terminate()
        }
    }
}
