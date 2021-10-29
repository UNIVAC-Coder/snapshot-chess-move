//
//  Snapshot_Chess_MoveDocument.swift
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
                                                           ,0,0,0,0,0,0,0,0], greenSquare: 100, redSquare: 100, index: 0, header: "A Snapshot Chess Move", footer: "Comment.")]
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
        self.chessMoves = parse.decodeDecodable([ChessMove].self, forKey: CodingKeys.chessmoves) ?? [ChessMove(id: UUID(), chessBoard:                    [0,0,0,0,0,0,0,0
                          ,0,0,0,0,0,0,0,0
                          ,0,0,0,0,0,0,0,0
                          ,0,0,0,0,0,0,0,0
                          ,0,0,0,0,0,0,0,0
                          ,0,0,0,0,0,0,0,0
                          ,0,0,0,0,0,0,0,0
                          ,0,0,0,0,0,0,0,0], greenSquare: 100, redSquare: 100, index: 0, header: "A Snapshot Chess Move", footer: "Comment.")]
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let abc = NSKeyedArchiver(requiringSecureCoding: true)
        try abc.encodeEncodable(self.chessMoves, forKey: CodingKeys.chessmoves)
        abc.finishEncoding()
        return FileWrapper(regularFileWithContents: abc.encodedData)
    }
    
}
