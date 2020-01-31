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

	override init() {
	    super.init()
		// Add your subclass-specific initialization here.
	}

	override class var autosavesInPlace: Bool {
		return true
	}

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

	lazy var encoder: some JSONEncoder = {
		let encoder = JSONEncoder()
		encoder.outputFormatting = .prettyPrinted
		// sort keys so that diffs are possible?
		encoder.outputFormatting.formUnion(.sortedKeys)
		// more readable date format
		encoder.dateEncodingStrategy = .iso8601
		return encoder
	}()

	lazy var decoder: some JSONDecoder = {
		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .iso8601
		return decoder
	}()

	override func data(ofType typeName: String) throws -> Data {
		// Insert code here to write your document to data of the specified type, throwing an error in case of failure.
		// Alternatively, you could remove this method and override fileWrapper(ofType:), write(to:ofType:), or write(to:ofType:for:originalContentsURL:) instead.
		let data = try encoder.encode(disks)
		return try data.zipped()
	}

	override func read(from data: Data, ofType typeName: String) throws {
		// Insert code here to read your document from the given data of the specified type, throwing an error in case of failure.
		// Alternatively, you could remove this method and override read(from:ofType:) instead.
		// If you do, you should also override isEntireFileLoaded to return false if the contents are lazily loaded.
		try disks = decoder.decode([DiskModel].self, from: try data.unzipped())
	}
}
