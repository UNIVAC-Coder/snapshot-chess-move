//
//  ChessMove.swift
//  Snapshot-Chess-Move
//
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
    var greenSquare         :Int = 100
    var redSquare           :Int = 100
    
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
    }
    
    init(id: UUID, chessBoard: [Int], greenSquare: Int, redSquare: Int) {
        self.id = id
        self.chessBoard = chessBoard
        self.greenSquare = greenSquare
        self.redSquare = redSquare
    }
}
