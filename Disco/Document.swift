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
	/// List of disks stored in this document
	var disks: [DiskModel] = [DiskModel()]

	override class var autosavesInPlace: Bool { true }

	override func makeWindowControllers() {
		// Create the SwiftUI view that provides the window contents.
		let contentView = ContentView()

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
		let data = try encoder.encode(disks)
		Swift.print(String(data: data, encoding: .utf8) ?? "JSON encoding error")
		return try data.zipped()
	}

	override func read(from zippedData: Data, ofType typeName: String) throws {
		let data = try zippedData.unzipped()
		Swift.print(String(data: data, encoding: .utf8) ?? "JSON decoding error")
		try disks = decoder.decode([DiskModel].self, from: data)
	}
}
