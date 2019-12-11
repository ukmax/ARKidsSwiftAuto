//
//  ARKidsUITests.swift
//  ARKidsUITests
//
//  Created by Ukraintsev, Maxim on 10/12/2019.
//  Copyright © 2019 Victor Sobolev. All rights reserved.
//

import XCTest

class ARKidsUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testBuyBicycle() {
                    
        let app = XCUIApplication()
        app.launch()
        let gardener = app.cells.element(boundBy: 0)
        gardener.tap()
        let marketButton = app.buttons["marketIcon"]
        marketButton.tap()
        app.cells.element(boundBy: 0).swipeUp()
        let bicycleCell = app.cells.containing(.staticText, identifier: "Bicycle")
        let  buyButton = bicycleCell.children(matching: .button).element(boundBy: 0)
        buyButton.tap()
        let returnToProfuleButton = app.buttons["Profile"]
        returnToProfuleButton.tap()
        app.cells.element(boundBy: 0).swipeUp()
        let bicycleInMyProducts = app.cells.element(boundBy: 6)
        XCTAssertTrue(bicycleInMyProducts.exists)
    }
    
    func testDeposit() {
                    
        let app = XCUIApplication()
        
        app.launchArguments = ["rate25%"]
        app.launch()
        let gardener = app.cells.element(boundBy: 0)
        gardener.tap()
        let marketButton = app.buttons["marketIcon"]
        marketButton.tap()
        let depositCell = app.cells.containing(.staticText, identifier: "Deposit")
        let depositButton = depositCell.children(matching: .button).element(boundBy: 0)
        depositButton.tap()
        let popupText = app.staticTexts["You've just invested in the 25% deposit"]
        XCTAssertTrue(popupText.exists)
        let popupConfirmButton = app.buttons["Thanks!"]
        popupConfirmButton.tap()
        let returnToProfuleButton = app.buttons["Profile"]
        returnToProfuleButton.tap()
        print()
        let rateText = app.staticTexts["100 $ +25%"]
        XCTAssertTrue(rateText.exists)
        
        

    }

}

