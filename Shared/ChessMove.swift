//
//  ChessMove.swift
//  Snapshot-Chess-Move
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
    }
    
    init(id: UUID, chessBoard: [Int], greenSquare: Int, redSquare: Int, index: Int) {
        self.id = id
        self.chessBoard = chessBoard
        self.greenSquare = greenSquare
        self.redSquare = redSquare
        self.index = index
    }
    
    init(copyBoard: ChessMove) {
        self.id = UUID()
        self.chessBoard = Array(copyBoard.chessBoard)
        self.greenSquare = Int(copyBoard.greenSquare)
        self.redSquare = Int(copyBoard.redSquare)
        self.index = Int(copyBoard.index)
    }
}
