//
//  Document.swift
//  Disco-uikit
//
//  Created by Reid Ellis on 2020-05-17.
//  Copyright © 2020 Tnir Technologies. All rights reserved.
//

import UIKit

class Document: UIDocument {
    
    override func contents(forType typeName: String) throws -> Any {
        // Encode your document with an instance of NSData or NSFileWrapper
        return Data()
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        // Load your document from contents
    }
}

