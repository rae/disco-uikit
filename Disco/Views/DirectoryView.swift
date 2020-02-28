//
//  DirectoryView.swift
//  Disco
//
//  Created by Reid Ellis on 2020-02-12.
//  Copyright © 2020 Tnir Technologies. All rights reserved.
//

import Foundation
import SwiftUI

struct DirectoryView: View {
	@State var directory: DirectoryModel
	var body: some View {
		Text("> \(directory.filename)").bold()
	}
}
