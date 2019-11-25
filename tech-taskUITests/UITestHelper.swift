import XCTest
import Foundation

class UITestHelper {
    //Helper to 
    let artists = ["Ellie Goulding", "G Unit", "Jimi Hendrix", "Cardi B", "I Prevail", "Adele", "Dolly Parson", "Hanson Twins"]

    func confirmArtistStandardPage(artist: String) {
        //Given I have I have navigated to the list of artists
        //And I see the artist in question
        XCTAssertTrue(XCUIApplication().tables.staticTexts[artist].waitForExistence(timeout: tenSecondTimeout), "\(artist) does not exist.")

        //When I tap on the artist
        XCUIApplication().tables.staticTexts[artist].tap()

        //Then I see a screen with title"ArtistView"
        //And I see text on screen "Artist page for 'artist in question'"
        XCTAssertTrue(XCUIApplication().navigationBars["ArtistView"].waitForExistence(timeout: tenSecondTimeout))
        XCTAssertTrue(XCUIApplication().staticTexts["Artist page for \(artist)"].exists, "This is not the Artist page for \(artist).")
    }

    let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")

    enum SystemPermissionAction: String {
        case Allow = "Allow While Using App"
        case AllowOnce = "Allow Once"
        case Deny = "Don’t Allow"
    }

    func selectOptionLocationPushNotification(action: SystemPermissionAction) {
        let systemAlerts = springboard.alerts["Allow “tech-task” to access your location?"].scrollViews.otherElements.staticTexts["Allow “tech-task” to access your location?"]
        let selection = springboard.buttons
        if  systemAlerts.exists {
            XCTAssertTrue(selection[action.rawValue].exists, "\(action.rawValue) button does not show.")
            selection[action.rawValue].tap()
        }
    }
}
