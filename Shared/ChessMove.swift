//
//  ChessMove.swift
//  Snapshot-Chess-Move
//  Creative Commons Attribution 4.0 International Public License
//  Creative Commons may be contacted at creativecommons.org.
//
//  Copyright (c) 2021 Thomas Cavalli
//  Thomas Cavalli may be contacted at thomascavalli.com
//
//  List of What Changed (by Who and When):
//  Created by Thomas Cavalli on 10/21/21.
//

import Foundation

class ChessMove: Identifiable, Codable {
    
    var id                 :UUID = UUID()
    var chessBoard         :[Int] =  [0,0,0,0,0,0,0,0
                                     ,0,0,0,0,0,0,0,0
                                     ,0,0,0,0,0,0,0,0
                                     ,0,0,0,0,0,0,0,0
                                     ,0,0,0,0,0,0,0,0
                                     ,0,0,0,0,0,0,0,0
                                     ,0,0,0,0,0,0,0,0
                                     ,0,0,0,0,0,0,0,0]
    var greenSquare        :Int = 100
    var redSquare          :Int = 100
    var index              :Int = 0
    var header             :String = "A Snapshot Chess Move"
    var footer             :String = "Comment."
    
    
    init() {
        self.id = UUID()
        self.chessBoard =  [0,0,0,0,0,0,0,0
                           ,0,0,0,0,0,0,0,0
                           ,0,0,0,0,0,0,0,0
                           ,0,0,0,0,0,0,0,0
                           ,0,0,0,0,0,0,0,0
                           ,0,0,0,0,0,0,0,0
                           ,0,0,0,0,0,0,0,0
                           ,0,0,0,0,0,0,0,0]
        self.greenSquare = 100
        self.redSquare = 100
        self.index = 0
        self.header = "A Snapshot Chess Move"
        self.footer = "Comment."
    }
    
    init(id: UUID, chessBoard: [Int], greenSquare: Int, redSquare: Int, index: Int, header: String, footer: String) {
        self.id = id
        self.chessBoard = chessBoard
        self.greenSquare = greenSquare
        self.redSquare = redSquare
        self.index = index
        self.header = header
        self.footer = footer
    }
    
    init(copyBoard: ChessMove) {
        self.id = UUID()
        self.chessBoard = Array(copyBoard.chessBoard)
        self.greenSquare = Int(copyBoard.greenSquare)
        self.redSquare = Int(copyBoard.redSquare)
        self.index = Int(copyBoard.index)
        self.header = String(copyBoard.header)
        self.footer = String(copyBoard.footer)
    }
}
