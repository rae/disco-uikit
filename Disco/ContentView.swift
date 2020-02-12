//
//  ContentView.swift
//  Disco
//
//  Created by Reid Ellis on 2020-01-31.
//  Copyright © 2020 Tnir Technologies. All rights reserved.
//

import SwiftUI

struct ContentView: View, DropDelegate {
	@State var document: Document
    var body: some View {
		List {
			ForEach(document.disks) { disk in
				Section(header: Text(disk.filename)) {
					ForEach(disk.directories) { dir in
						Text(dir.filename)
					}
					ForEach(disk.files) { file in
						Text(" - \(file.filename)")
					}
				}
			}
		}.onDrop(of: [""], delegate: self)
    }

	func dropUpdated(info: DropInfo) -> DropProposal? {
	  let proposal = DropProposal.init(operation: .copy)
	  return proposal
	}

	func performDrop(info: DropInfo) -> Bool {
		print("perform drop")
		info.itemProviders(for: [(kUTTypeFileURL as String)]).forEach { itemProvider in
			itemProvider.loadItem(forTypeIdentifier: (kUTTypeFileURL as String), options: nil) { item, error in
				guard let data = item as? Data, let url = URL(dataRepresentation: data, relativeTo: nil)
				else { return }
				// Do something with the file url
				// remember to dispatch on main in case of a @State change
				print("dropping \"\(url.absoluteString)\"")
			}
		}

		return true
	}
}

struct ContentView_Previews: PreviewProvider {
	static var disks: [DiskModel] = {
		return [
			DiskModel("Fred"),
			DiskModel("Wilma"),
			DiskModel("Pebbles"),
			DiskModel("Dino")
		]
	}()
	static var document: Document = {
		var doc = Document()
		doc.disks = disks
		return doc
	}()
    static var previews: some View {
		ContentView(document: document)
    }
}
