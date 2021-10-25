//
//  ContentView.swift
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
//  Created by Thomas Cavalli on 10/21/21.
//

import SwiftUI

private var geometryWidth: CGFloat = -1 // undefined
private var geometryHeight: CGFloat = -1
private var geometryLength: CGFloat = 52 // a reasonable value to start with.

struct ContentView: View {
    @Binding var document: Snapshot_Chess_MoveDocument
    @State private var isBoardView: Bool = true
    @State private var theChessMove: ChessMove = ChessMove()
    
    var body: some View {
        GeometryReader { geometry in
            if isBoardView {
                if self.document.chessMoves.count > 0 {
                    HStack {
                        Spacer()
                        ScrollView {
                            ForEach(self.document.chessMoves, id: \.id) {aChessMove in
                                BoardView(chessMove: aChessMove, length: SquareSide(geometry: geometry))
                                    .onTapGesture {
                                        theChessMove = ChessMove(copyBoard: aChessMove)
                                        isBoardView = false
                                    }
                                
                            }
                        }
                        Spacer()
                    }
                }else{
                    Text("Tap to Add first chess move")
                        .frame(width: 200.0, height: 50.0, alignment: .center)
                        .background(Color.white)
                        .onTapGesture {
                            document.chessMoves =  [ChessMove()]
                            theChessMove = ChessMove()
                            isBoardView = false
                        }
                }
            }else{ //isBoardView is false
                EditView(chessMove: $theChessMove, isBoardView: $isBoardView, document: $document, length: SquareSide(geometry: geometry))
            }
        }
    }
    
    func SquareSide(geometry: GeometryProxy) -> CGFloat {
        if geometryWidth != geometry.size.width || geometryHeight != geometry.size.height {
            geometryWidth = geometry.size.width
            geometryHeight = geometry.size.height
            var a = geometryWidth
            let b = geometryHeight - (geometryHeight / 9.0)
            if a > b { a = b }
            geometryLength = a / 11.0 //there are eleven rows on this screen
        }
        return geometryLength
    }
}
/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
