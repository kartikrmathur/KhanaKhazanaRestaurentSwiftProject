//
//  khanakhazanaTests.swift
//  KhanaKhazanaTests
//
//  Unit tests for Khana Khazana iOS app — Models and DatabaseHandler.
//  Follows AAA (Arrange, Act, Assert).
//

import XCTest
@testable import KhanaKhazana  // Use "khanakhazana" if your app target module is lowercase

// MARK: - User model tests

class UserModelTests: XCTestCase {

    func testUserInitWithAllFields() {
        // Arrange & Act
        let user = user(
            Id: 1,
            Username: "john",
            Password: "secret",
            Name: "John Doe",
            FathersName: "James",
            MothersName: "Mary",
            PhoneNo: "1234567890",
            EmailId: "john@example.com",
            Address: "123 Main St",
            Photo: "photo.jpg"
        )
        // Assert
        XCTAssertEqual(user.id, 1)
        XCTAssertEqual(user.username, "john")
        XCTAssertEqual(user.password, "secret")
        XCTAssertEqual(user.name, "John Doe")
        XCTAssertEqual(user.fathersName, "James")
        XCTAssertEqual(user.mothersName, "Mary")
        XCTAssertEqual(user.phoneNo, "1234567890")
        XCTAssertEqual(user.emailId, "john@example.com")
        XCTAssertEqual(user.address, "123 Main St")
        XCTAssertEqual(user.photo, "photo.jpg")
    }

    func testUserInitWithNilFields() {
        // Arrange & Act
        let user = user(
            Id: nil,
            Username: nil,
            Password: nil,
            Name: nil,
            FathersName: nil,
            MothersName: nil,
            PhoneNo: nil,
            EmailId: nil,
            Address: nil,
            Photo: nil
        )
        // Assert
        XCTAssertNil(user.id)
        XCTAssertNil(user.username)
        XCTAssertNil(user.name)
    }
}

// MARK: - Menu item (file) model tests

class MenuItemModelTests: XCTestCase {

    func testFileInitWithAllFields() {
        // Arrange & Act
        let item = file(dishname: "Pasta", cost: "12.99", filename: "pasta.jpg", id: 42)
        // Assert
        XCTAssertEqual(item.dishname, "Pasta")
        XCTAssertEqual(item.cost, "12.99")
        XCTAssertEqual(item.filename, "pasta.jpg")
        XCTAssertEqual(item.id, 42)
    }

    func testFileInitWithNilFields() {
        // Arrange & Act
        let item = file(dishname: nil, cost: nil, filename: nil, id: nil)
        // Assert
        XCTAssertNil(item.dishname)
        XCTAssertNil(item.cost)
        XCTAssertNil(item.filename)
        XCTAssertNil(item.id)
    }
}

// MARK: - DatabaseHandler tests

class DatabaseHandlerTests: XCTestCase {

    func testDatabaseHandlerInstantiation() {
        // Arrange & Act
        let handler = DatabaseHandler()
        // Assert
        XCTAssertNotNil(handler)
        XCTAssertNotNil(handler.tableList)
        XCTAssertTrue(handler.tableList.isEmpty)
    }

    func testCopyDatabaseIfNeededDoesNotCrash() {
        // Arrange
        let handler = DatabaseHandler()
        // Act & Assert (no crash)
        handler.copyDatabaseIfNeeded()
    }
}
