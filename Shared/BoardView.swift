//
//  ContentView.swift
//  Shared
//
//  Created by Thomas Cavalli on 9/29/21.
//

import SwiftUI

private var geometryWidth : CGFloat = -1 // undefined
private var geometryHeight: CGFloat = -1
private var geometryLength: CGFloat = 52 // a reasonable value to start with.


struct BoardView: View {
    var chessMove: ChessMove
    
    var body: some View {
        GeometryReader() { geometry in
            HStack {
                VStack {
                    Text("Chess world unite!")
                        .frame(height: SquareSide2(geometry: geometry) * 0.75, alignment: .center)
                        .font(.system(size: SquareSide2(geometry: geometry) * 0.5 ))
                        
                    VStack(spacing: 0.0) {
                        ForEach([0,8,16,24,32,40,48,56], id: \.self) { row in
                            HStack(spacing: 0.0) {
                                ForEach((0...7), id: \.self) { col in
                                    SquareView4(length: SquareSide2(geometry: geometry), greenBoarder: chessMove.greenSquare, redBoarder: chessMove.redSquare , squareNumber: row + col, color: (((row / 8) + col) % 2), chessBoard: chessMove.chessBoard)
                                      
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
/*
func GetPiece(h: String) -> Int {
    var a: Int = 0 // none, default value of translation.
    if h == "BlackKing"     { a =  1}
    if h == "BlackQueen"    { a =  2}
    if h == "BlackBishop"   { a =  3}
    if h == "BlackKnight"   { a =  4}
    if h == "BlackRook"     { a =  5}
    if h == "BlackPawn"     { a =  6}
    if h == "WhiteKing"     { a =  9}
    if h == "WhiteQueen"    { a = 10}
    if h == "WhiteBishop"   { a = 11}
    if h == "WhiteKnight"   { a = 12}
    if h == "WhiteRook"     { a = 13}
    if h == "WhitePawn"     { a = 14}
    return a
}
*/
func SquareSide2(geometry: GeometryProxy) -> CGFloat {
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
/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
