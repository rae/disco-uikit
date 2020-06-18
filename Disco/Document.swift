//
//  Document.swift
//  Disco
//
//  Created by Reid Ellis on 2020-01-31.
//  Copyright © 2020 Tnir Technologies. All rights reserved.
//

import Cocoa
import SwiftUI

class Document: NSDocument {
    enum Format: String, Codable {
        // clear JSON text
        case json
        // compressed JSON text
        case disco
    }

	enum FileError: Error {
		case invalidInput
	}
	/// List of disks stored in this document
	var disks: [DiskModel] = [DiskModel()]

    var format: Format = .json

	override class var autosavesInPlace: Bool { true }

	override func makeWindowControllers() {
		// Create the SwiftUI view that provides the window contents.
		let contentView = ContentView(document: self)

		// Create the window and set the content view.
		let window = NSWindow(
		    contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
		    styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
		    backing: .buffered, defer: false)
		window.center()
		window.contentView = NSHostingView(rootView: contentView)
		let windowController = NSWindowController(window: window)
		self.addWindowController(windowController)
	}

	/// JSON encode
	lazy var encoder: some JSONEncoder = {
		let encoder = JSONEncoder()
		encoder.outputFormatting = .prettyPrinted
		// sort keys so that diffs are possible?
		encoder.outputFormatting.formUnion(.sortedKeys)
		// more readable date format
		encoder.dateEncodingStrategy = .iso8601
		return encoder
	}()

	/// JSON decoder
	lazy var decoder: some JSONDecoder = {
		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .iso8601
		return decoder
	}()

	override func data(ofType typeName: String) throws -> Data {
        guard let format = Format(rawValue: typeName)
		else { throw FileError.invalidInput }
		let data = try encoder.encode(disks)
		Swift.print(String(data: data, encoding: .utf8) ?? "JSON encoding error")
        switch format {
        case .disco:
            return try data.zipped()
        case .json:
            return data
        }
	}

	override func read(from rawData: Data, ofType typeName: String) throws {
        guard let format = Format(rawValue: typeName)
		else { throw FileError.invalidInput }
        let data: Data
        switch format {
        case .disco:
            data = try rawData.unzipped()
        case .json:
            data = rawData
        }
		Swift.print(String(data: data, encoding: .utf8) ?? "JSON decoding error")
		try disks = decoder.decode([DiskModel].self, from: data)
	}
}
