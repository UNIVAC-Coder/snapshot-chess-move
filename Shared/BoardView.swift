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
//  Created by Thomas Cavalli on 9/29/21.
//

import SwiftUI

struct BoardView: View {
    var chessMove: ChessMove
    var length: CGFloat
    
    var body: some View {
        HStack {
            VStack {
                Text("\(chessMove.index)")
                    .frame(width: length * 9.0, height: 3.0, alignment: .center)
                    .background(Color("DividerColor"))
                    .padding()
                Text("Chess world unite!")
                    .frame(height: length * 0.75, alignment: .center)
                    .font(.system(size: length * 0.5 ))
                    
                VStack(spacing: 0.0) {
                    ForEach([0,8,16,24,32,40,48,56], id: \.self) { row in
                        HStack(spacing: 0.0) {
                            ForEach((0...7), id: \.self) { col in
                                SquareView4(length: length, greenBoarder: chessMove.greenSquare, redBoarder: chessMove.redSquare , squareNumber: row + col, color: (((row / 8) + col) % 2), chessBoard: chessMove.chessBoard)
                                  
                            }
                        }
                    }
                }
            }
        }
    }
}
/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
