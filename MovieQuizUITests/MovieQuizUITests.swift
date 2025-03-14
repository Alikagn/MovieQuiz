//
//  MovieQuizUITests.swift
//  MovieQuizUITests
//
//  Created by Dmitry Batorevich on 04.03.2025.
//

import XCTest

final class MovieQuizUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
        app = XCUIApplication()
        app.launch()
        
        continueAfterFailure = false

    }

    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
        app.terminate()
        app = nil
    }

    func testYesButton() {
        sleep(3)
            
            let firstPoster = app.images["Poster"]
            let firstPosterData = firstPoster.screenshot().pngRepresentation
            
            app.buttons["Yes"].tap()
            sleep(3)
            
            let secondPoster = app.images["Poster"]
            let secondPosterData = secondPoster.screenshot().pngRepresentation
            
            XCTAssertNotEqual(firstPosterData, secondPosterData)
            
    }
    
    func testNoButton() {
        sleep(3)
            
            let firstPoster = app.images["Poster"]
            let firstPosterData = firstPoster.screenshot().pngRepresentation
            app.buttons["No"].tap()
            sleep(3)
            
            let secondPoster = app.images["Poster"]
            let secondPosterData = secondPoster.screenshot().pngRepresentation
            XCTAssertNotEqual(firstPosterData, secondPosterData)
    }
    
    func testIndexLabel() {
        sleep(3)
    
            let firstindexLabel = app.staticTexts["Index"]
            app.buttons["No"].tap()
            sleep(3)
            
            let secondindexLabel = app.staticTexts["Index"]
            XCTAssertNotEqual(firstindexLabel, secondindexLabel)
    }
    
    func testAlert() {
        sleep(3)
        for _ in 0...9 {
            app.buttons["No"].tap()
            sleep(2)
        }
            sleep(3)
            let alert = app.alerts["Этот раунд окончен!"]
            XCTAssertTrue(alert.exists)
            XCTAssertTrue(alert.label == "Этот раунд окончен!")
            XCTAssertTrue(alert.buttons.firstMatch.label == "Сыграть ещё раз")
    }
    
    func testAlertDismiss() {
        sleep(2)
        for _ in 0...9 {
            app.buttons["No"].tap()
            sleep(2)
        }
        
        let alert = app.alerts["Этот раунд окончен!"]
        alert.buttons.firstMatch.tap()
        
        sleep(2)
        
        let indexLabel = app.staticTexts["Index"]
        
        XCTAssertFalse(alert.exists)
        XCTAssertTrue(indexLabel.label == "1/10")
    }
    
    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    @MainActor
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
