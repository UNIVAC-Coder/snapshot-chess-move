//
//  Snapshot_Chess_MoveApp.swift
//  Shared
//  Creative Commons Attribution 4.0 International Public License
//  Creative Commons may be contacted at creativecommons.org.
//
//  Copyright (c) 2021 Thomas Cavalli
//  Thomas Cavalli may be contacted at thomascavalli.com
//
//  List of What Changed (by Who and When):
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
