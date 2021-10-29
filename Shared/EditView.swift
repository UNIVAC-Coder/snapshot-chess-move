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
//  Created by Thomas Cavalli on 9/29/21.
//

import SwiftUI

struct EditView: View {
    @Binding var chessMove: ChessMove
    @Binding var isBoardView: Bool
    @Binding var document: Snapshot_Chess_MoveDocument
    var length: CGFloat
    @State private var selected2: [Int] = [1,2,3,4,5,6] // Black KQBKRP values by piece number.
    @State private var on: Bool = true
    @State private var pieceColor: Bool = true //is black, false is white
    @State private var boarderColor: Int = 0 //0 = none, 1 = green, 2 = red
    @State private var isTargetedYes: Bool = true
    @State private var succeeded: Bool = true
    @State private var confirm: Bool = false
    @State private var confirmSelection: Int = 0 //is none, 1 is clear board, 2 is set board, 3 is Cancel.
    @State private var message: String = "Editing"
    
    var body: some View {
        GeometryReader() { geometry in
            HStack {
                Spacer()
                VStack(spacing: 0.0) {
                    Text(message + " #\(chessMove.index)")
                        .frame(height: length * 0.7, alignment: .center)
                        .font(.system(size: length * 0.5))
                        .foregroundColor(Color("DividerColor"))
                    TextEditor(text: $chessMove.header)
                        .frame(height: length * 0.75, alignment: .center)
                        .font(.system(size: length * 0.35 ))
                        .foregroundColor(Color("DividerColor"))
                        .multilineTextAlignment(.center)
                    VStack(spacing: 0.0) {
                        ForEach([0,8,16,24,32,40,48,56], id: \.self) { row in
                            HStack(spacing: 0.0) {
                                ForEach((0...7), id: \.self) { col in
                                    SquareView(length: length,
                                               greenBoarder: $chessMove.greenSquare,
                                               redBoarder: $chessMove.redSquare,
                                               squareNumber: row + col,
                                               color: (((row / 8) + col) % 2),
                                               chessBoard: $chessMove.chessBoard,
                                               boarderColor: boarderColor,
                                               document: $document)
                                        .onDrop(of: ["public.data"], isTargeted: $isTargetedYes) { NSItemProviders in
                                            DispatchQueue.main.async {
                                                succeeded = true
                                                if let a = NSItemProviders.first {
                                                    a.loadItem(forTypeIdentifier: "public.data", options: nil) { (c, d) in
                                                        if let e = c as? Data {
                                                            do {
                                                                if let h = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(e) as? String {
                                                                    DispatchQueue.main.async {
                                                                        chessMove.chessBoard[row + col] = GetPiece(h: h)
                                                                        if document.chessMoves.count > 0 {
                                                                            document.chessMoves[0] = document.chessMoves[0]
                                                                        }
                                                                        message = "Changing"
                                                                    }
                                                                    
                                                                }
                                                            } catch {
                                                                succeeded = false
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                            return succeeded
                                        }
                                }
                            }
                        }
                    }
                    .padding()
                    TextEditor(text: $chessMove.footer)
                        .frame(height: length * 3.0, alignment: .center)
                        .font(.system(size: length * 0.35 ))
                        .foregroundColor(Color("DividerColor"))
                        .multilineTextAlignment(.center)
                    //Text("")
                    //    .frame(height: length * 0.75, alignment: .center)
                    HStack(spacing: 0.0) {
                        SquareView3(length: length, boarderColor: $boarderColor, bgColor: pieceColor)
                        SquareView1(length: length, piecesColor: $pieceColor, BGcolor: false, selected2: $selected2)
                        SquareView2(length: length, selected: $selected2, index: 0, bgColor: !pieceColor)
                        SquareView2(length: length, selected: $selected2, index: 1, bgColor: pieceColor)
                        SquareView2(length: length, selected: $selected2, index: 2, bgColor: !pieceColor)
                        SquareView2(length: length, selected: $selected2, index: 3, bgColor: pieceColor)
                        SquareView2(length: length, selected: $selected2, index: 4, bgColor: !pieceColor)
                        SquareView2(length: length, selected: $selected2, index: 5, bgColor: pieceColor)
                    }
                    HStack {
                        Button((confirm && confirmSelection == 1) ? "Cancel" : "Clear Board") {
                            if confirm {
                                confirm = false
                                confirmSelection = 0
                            }else{
                                confirm = true
                                confirmSelection = 1
                                message = "Clear Entire Board?"
                            }
                        }
                        .frame(height: length, alignment: .center)
                        .disabled(confirm && confirmSelection != 1)
                        
                        Button((confirm && confirmSelection == 2) ? "Cancel" : "Setup Board") {
                            if confirm {
                                confirm = false
                                confirmSelection = 0
           
                            }else{
                                confirm = true
                                confirmSelection = 2
                                message = "Setup Board Pieces?"
                            }
                        }
                        .frame(height: length, alignment: .center)
                        .disabled(confirm && confirmSelection != 2)
                        
                        Button((confirm && confirmSelection == 3) ? "Keep Changes" : "Cancel Changes") {
                            if confirm {
                                confirm = false
                                confirmSelection = 0
                            }else{
                                confirm = true
                                confirmSelection = 3
                                message = "Discard Changes?"
                            }
                        }
                        .disabled(confirm && confirmSelection != 3)
                    }
                    HStack {
                        Button("Confirm") {
                            switch confirmSelection {
                            case 1:
                                chessMove.chessBoard =
                                                  [0,0,0,0,0,0,0,0
                                                  ,0,0,0,0,0,0,0,0
                                                  ,0,0,0,0,0,0,0,0
                                                  ,0,0,0,0,0,0,0,0
                                                  ,0,0,0,0,0,0,0,0
                                                  ,0,0,0,0,0,0,0,0
                                                  ,0,0,0,0,0,0,0,0
                                                  ,0,0,0,0,0,0,0,0]
                                break
                            case 2:
                                chessMove.chessBoard =
                                                  [5,4,3,2,1,3,4,5
                                                  ,6,6,6,6,6,6,6,6
                                                  ,0,0,0,0,0,0,0,0
                                                  ,0,0,0,0,0,0,0,0
                                                  ,0,0,0,0,0,0,0,0
                                                  ,0,0,0,0,0,0,0,0
                                                  ,14,14,14,14,14,14,14,14
                                                  ,13,12,11,10, 9,11,12,13]
                                break
                            case 3:
                                isBoardView = true
                                break
                            default:
                                break
                                
                            }
                            confirm = false
                            confirmSelection = 0
                        }
                        .frame(height: length, alignment: .center)
                        .disabled(!confirm)
                        Button("Save Board") {
                            if chessMove.index == document.chessMoves.count {
                                document.chessMoves.append(ChessMove(copyBoard: chessMove))
                                for i in document.chessMoves.indices {
                                    document.chessMoves[i].index = Int(i)
                                }
                                isBoardView = true
                            }else{
                                document.chessMoves[chessMove.index] = chessMove
                                isBoardView = true
                            }
                        }
                        .disabled(confirm)
                        Button("Copy Board") {
                            chessMove.index = Int(document.chessMoves.count)
                            message = "Copied"
                        }
                        .disabled(confirm)
                    }
                }
                //HStack {} //next row of buttons...
                Spacer()
            }
        }
    }
}
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

/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
