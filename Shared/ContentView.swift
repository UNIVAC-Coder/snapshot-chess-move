//
//  ContentView.swift
//  Shared
//
//  Created by Tom Cavalli on 10/18/21.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: Snapshot_Chess_MoveDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(Snapshot_Chess_MoveDocument()))
    }
}
