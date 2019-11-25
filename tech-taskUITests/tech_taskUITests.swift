//
//  tech_taskUITests.swift
//  tech-taskUITests
//
//  Created by Leighroy on 28/10/2019.
//  Copyright © 2019 DICE FM. All rights reserved.
//

import XCTest

class tech_taskUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
        super.setUp()
    }

    func testArtistStandardPage() {
        for artist in UITestHelper().artists {
            UITestHelper().confirmArtistStandardPage(artist: artist)
            XCUIApplication().navigationBars.buttons["Back"].tap()
        }
    }

    func testBeyonce() {
        //Given "Beyonce" is on the list of artists
        XCTAssertTrue(XCUIApplication().tables.staticTexts["Beyonce"].waitForExistence(timeout: tenSecondTimeout))

        //When I tap on the artist "Beyonce"
        XCUIApplication().tables.staticTexts["Beyonce"].tap()

        //Then I see a screen with title "WaitingView"
        //And I immediately see text on screen "loading"
        //And after a few seconds I see "Finished Loading" and loaded
        XCTAssertTrue(XCUIApplication().navigationBars["WaitingView"].waitForExistence(timeout: tenSecondTimeout), "This view is not called 'WaitingView'.")
        XCTAssertTrue(XCUIApplication().staticTexts["loading..."].exists)
        XCTAssertTrue(XCUIApplication().staticTexts["Finished Loading"].waitForExistence(timeout: tenSecondTimeout))
        XCTAssertTrue(XCUIApplication().staticTexts["loaded"].exists)
    }
}

class tech_taskUITests_Reset_Location: XCTestCase {

    override func setUp() {
        Springboard().deleteApp()
        Springboard().resetLocationSettings()
        continueAfterFailure = false
        XCUIApplication().launch()
        super.setUp()
    }

    func testNavigateToFrankSinatraLocationView() {
        //Given "Frank Sinatra" is on the list of artists
        XCTAssertTrue(XCUIApplication().tables.staticTexts["Frank Sinatra"].waitForExistence(timeout: tenSecondTimeout), "Frank Sinatra does not exist.")

        //When I tap on the artist "Frank Sinatra"
        XCUIApplication().tables.staticTexts["Frank Sinatra"].tap()

        //Then I see a screen with title "LocationView"
        //And I see text on screen "Get Location" and "Not determined"
        XCTAssertTrue(XCUIApplication().navigationBars["LocationView"].exists)
        XCTAssertTrue(XCUIApplication().buttons["Get Location"].waitForExistence(timeout: tenSecondTimeout), "Get Location button does not show.")
        XCTAssertTrue(XCUIApplication().staticTexts["Not determined"].exists)
    }

    func testFrankSinatraAllowLocation() {
        //Given I have navigated to the Frank Sinatra Location View
        testNavigateToFrankSinatraLocationView()

        //When I tap on "Get Location"
        //And I select "Allow"
        XCUIApplication().buttons["Get Location"].tap()
        UITestHelper().selectOptionLocationPushNotification(action: .Allow)

        //Then I see text on screen "Get Location" and "Authorized"
        XCTAssertTrue(XCUIApplication().buttons["Get Location"].waitForExistence(timeout: tenSecondTimeout))
        XCTAssertTrue(XCUIApplication().staticTexts["Authorized"].exists)
    }

    func testFrankSinatraAllowOnceLocation() {
        //Given I have navigated to the Frank Sinatra Location View
        testNavigateToFrankSinatraLocationView()

        //When I tap on "Get Location"
        //And I select "Allow Once"
        XCUIApplication().buttons["Get Location"].tap()
        UITestHelper().selectOptionLocationPushNotification(action: .AllowOnce)

        //Then I see text on screen "Get Location" and "Authorized"
        XCTAssertTrue(XCUIApplication().buttons["Get Location"].waitForExistence(timeout: tenSecondTimeout))
        XCTAssertTrue(XCUIApplication().staticTexts["Authorized"].exists)
    }

    func testFrankSinatraDenyLocation() {
        //Given I have navigated to the Frank Sinatra Location View
        testNavigateToFrankSinatraLocationView()

        //When I tap on "Get Location"
        //And I select "Don’t Allow"
        XCUIApplication().buttons["Get Location"].tap()
        UITestHelper().selectOptionLocationPushNotification(action: .Deny)

        //Then I see text on screen "Get Location" and "Denied"
        XCTAssertTrue(XCUIApplication().buttons["Get Location"].waitForExistence(timeout: tenSecondTimeout))
        XCTAssertTrue(XCUIApplication().staticTexts["Denied"].exists)
    }
}
