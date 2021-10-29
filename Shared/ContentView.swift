//
//  ContentView.swift
//  Shared
//  Creative Commons Attribution 4.0 International Public License
//  Creative Commons may be contacted at creativecommons.org.
//
//  Copyright (c) 2021 Thomas Cavalli
//  Thomas Cavalli may be contacted at thomascavalli.com
//
//  List of What Changed (by Who and When):
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
            geometryLength = a / 15.0 //there are 15 rows on this screen
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
