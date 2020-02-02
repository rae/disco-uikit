//
//  AppDelegate.swift
//  Disco
//
//  Created by Reid Ellis on 2020-01-31.
//  Copyright © 2020 Tnir Technologies. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
	func applicationDidFinishLaunching(_ aNotification: Notification) {
	}

	func applicationWillTerminate(_ aNotification: Notification) {
	}

	@IBAction func importAscii(_sender: Any) {
		let panel = NSOpenPanel()
		panel.begin { response in
			if response == .OK {
				panel.urls.forEach { url in
					print("import \(url.absoluteString)")
				}
			}
		}
	}
}

