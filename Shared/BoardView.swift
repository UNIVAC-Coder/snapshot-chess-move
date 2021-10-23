//
//  ContentView.swift
//  Shared
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
                Text("")
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
