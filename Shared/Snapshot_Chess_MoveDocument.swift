//
//  Snapshot_Chess_MoveDocument.swift
//  Shared
//  MIT License
//
//  Copyright (c) 2021 Thomas Cavalli
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//
//  Optional List of What Changed by Who and When.
//
//  Created by Thomas Cavalli on 10/18/21.
//

import SwiftUI
import UniformTypeIdentifiers

extension UTType {
    static var snapshotChessMove: UTType {
        UTType(importedAs: "com.thomascavalli.snapshot-chess-move")
    }
}

struct Snapshot_Chess_MoveDocument: FileDocument {
    var chessMoves: [ChessMove]

    init() {
        chessMoves = [ChessMove(id: UUID(), chessBoard:   [0,0,0,0,0,0,0,0
                                                          ,0,0,0,0,0,0,0,0
                                                          ,0,0,0,0,0,0,0,0
                                                          ,0,0,0,0,0,0,0,0
                                                          ,0,0,0,0,0,0,0,0
                                                          ,0,0,0,0,0,0,0,0
                                                          ,0,0,0,0,0,0,0,0
                                                          ,0,0,0,0,0,0,0,0], greenSquare: 100, redSquare: 100, index: 0)]
    }
    
    init(chessMoves: [ChessMove]) {
        self.chessMoves = chessMoves
    }
    
    static var readableContentTypes: [UTType] { [.snapshotChessMove] }
    
    struct CodingKeys {
        static let chessmoves = "ChessMovesArray"
    }

    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        let parse = try NSKeyedUnarchiver(forReadingFrom: data)
        parse.requiresSecureCoding = true
        self.chessMoves = parse.decodeDecodable([ChessMove].self, forKey: CodingKeys.chessmoves) ?? [ChessMove(id: UUID(), chessBoard:   [0,0,0,0,0,0,0,0
                          ,0,0,0,0,0,0,0,0
                          ,0,0,0,0,0,0,0,0
                          ,0,0,0,0,0,0,0,0
                          ,0,0,0,0,0,0,0,0
                          ,0,0,0,0,0,0,0,0
                          ,0,0,0,0,0,0,0,0
                          ,0,0,0,0,0,0,0,0], greenSquare: 100, redSquare: 100, index: 0)]
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let abc = NSKeyedArchiver(requiringSecureCoding: true)
        try abc.encodeEncodable(self.chessMoves, forKey: CodingKeys.chessmoves)
        abc.finishEncoding()
        return FileWrapper(regularFileWithContents: abc.encodedData)
    }
    
}
