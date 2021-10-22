//
//  Snapshot_Chess_MoveApp.swift
//  Shared
//
//  Created by Thomas Cavalli on 10/18/21.
//

import SwiftUI

@main
struct Snapshot_Chess_MoveApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: Snapshot_Chess_MoveDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
