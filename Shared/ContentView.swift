//
//  ContentView.swift
//  Shared
//
//  Created by Tom Cavalli on 10/21/21.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: Snapshot_Chess_MoveDocument
    @State private var isBoardView: Bool = true
    @State private var theChessMove: ChessMove = ChessMove()
    var body: some View {
        GeometryReader { geometry in
            if isBoardView {
                if self.document.chessMoves.count > 0 {
                    ScrollView {
                        ForEach(self.document.chessMoves, id: \.id) {aChessMove in
                            BoardView(chessMove: aChessMove)
                                .onTapGesture {
                                    theChessMove = aChessMove
                                    isBoardView = false
                                }
                        }
                    }
                }else{
                    Text("Add first chess move")
                        .frame(width: 200.0, height: 50.0, alignment: .center)
                        .onTapGesture {
                            document.chessMoves =  [ChessMove()]
                            theChessMove = ChessMove()
                            isBoardView = false
                        }
                }
            }else{ //isBoardView false
                EditView(chessMove: $theChessMove, isBoardView: $isBoardView, document: $document)
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
