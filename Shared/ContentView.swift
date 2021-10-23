//
//  ContentView.swift
//  Shared
//
//  Created by Tom Cavalli on 10/21/21.
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
                                        theChessMove = aChessMove
                                        isBoardView = false
                                    }
                                
                            }
                        }
                        Spacer()
                    }
                }else{
                    Text("Add first chess move")
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
