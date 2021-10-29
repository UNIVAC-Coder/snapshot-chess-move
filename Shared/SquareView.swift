//
//  SquareView.swift
//  Shared
//  Creative Commons Attribution 4.0 International Public License
//  Creative Commons may be contacted at creativecommons.org.
//
//  Copyright (c) 2021 Thomas Cavalli
//  Thomas Cavalli may be contacted at thomascavalli.com
//
//  List of What Changed (by Who and When):
//  Created by Thomas Cavalli on 10/5/21.
//

import SwiftUI

struct SquareView: View {
    var length:  CGFloat
    @Binding var greenBoarder: Int
    @Binding var redBoarder: Int
    var squareNumber: Int
    var color: Int //Background square color
    @Binding var chessBoard: [Int]
    var boarderColor: Int //0 none, 1 green, 2 red
    @Binding var document: Snapshot_Chess_MoveDocument
    
    var body: some View {
        ZStack {
            Image(greenBoarder == squareNumber ? "Green52" : redBoarder == squareNumber ? "Red52" : color == 1 ? "Black52" : "White52")
                .resizable()
                .frame(width: length, height: length, alignment: .center)
                .onTapGesture {
                    change()
                }
            Image( (color == 1) ? "Black52" : "White52" )
                .resizable()
                .frame(width: length * 0.9, height: length * 0.9, alignment: .center)
                .onTapGesture {
                    change()
                }
            if chessBoard[squareNumber] != 0 {
                Image(BoardImage(pieceName: chessBoard[squareNumber]) as String)
                    .resizable()
                    .frame(width: length * 0.9, height: length * 0.9, alignment: .center)
                    .onDrag {
                        let a = chessBoard[squareNumber]
                        DispatchQueue.main.async {
                            chessBoard[squareNumber] = 0
                        }
                        return NSItemProvider(item: BoardImage(pieceName: a), typeIdentifier: "public.data")
                    }
                    .onTapGesture {
                        change()
                    }
            }
        }
        .frame(width: length, height: length, alignment: .center)
    }
    func change() {
        switch squareNumber {
        case greenBoarder:
            switch boarderColor {
            case 0:
                greenBoarder = 100 //off
                update()
                break
            case 2:
                greenBoarder = 100
                redBoarder = squareNumber
                update()
                break
            default:
                break
            }
            break
        case redBoarder:
            switch boarderColor {
            case 0:
                redBoarder = 100
                update()
                break
            case 1:
                redBoarder = 100
                greenBoarder = squareNumber
                update()
                break
            default:
                break
            }
            break
        default: //neither green nor red boarder
            switch boarderColor {
            case 1:
                greenBoarder = squareNumber
                update()
                break
            case 2:
                redBoarder = squareNumber
                update()
                break
            default:
                break
            }
            break
        }
    }
    func update() {
        if document.chessMoves.count > 0 {
            document.chessMoves[0] = document.chessMoves[0]
        }
    }
    func BoardImage(pieceName: Int) -> NSString {
        var a = "White52"
        switch pieceName {
        case 100:
            a = "White52"
            break
        case 101:
            a = "Black52"
            break
        case 1:
            a = "BlackKing"
            break
        case 2:
            a = "BlackQueen"
            break
        case 3:
            a = "BlackBishop"
            break
        case 4:
            a = "BlackKnight"
            break
        case 5:
            a = "BlackRook"
            break
        case 6:
            a = "BlackPawn"
            break
        case 9:
            a = "WhiteKing"
            break
        case 10:
            a = "WhiteQueen"
            break
        case 11:
            a = "WhiteBishop"
            break
        case 12:
            a = "WhiteKnight"
            break
        case 13:
            a = "WhiteRook"
            break
        case 14:
            a = "WhitePawn"
            break
        default:
            break
        }
        return a as NSString
    }
    
}
/*
struct SquareView_Previews: PreviewProvider {
    static var previews: some View {
        SquareView()
    }
}
*/
