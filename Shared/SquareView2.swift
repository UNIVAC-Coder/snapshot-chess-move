//
//  SquareView.swift
//  Shared
//
//  Created by Thomas Cavalli on 10/5/21.
//

import SwiftUI

struct SquareView2: View {
    var length:  CGFloat
    @Binding var selected: [Int]
    var index: Int
    var bgColor: Bool
    
    var body: some View {
        ZStack {
            Image(selected[index] < 0 ? "Green52" : bgColor ? "Black52" : "White52")
                .resizable()
                .frame(width: length, height: length, alignment: .center)
            Image( bgColor ? "Black52" : "White52" )
                .resizable()
                .frame(width: length * 0.9, height: length * 0.9, alignment: .center)
            Image(BoardImage())
                .resizable()
                .frame(width: length * 0.9, height: length * 0.9, alignment: .center)
                .onDrag {
                    return NSItemProvider(item: BoardImage() as NSString, typeIdentifier: "public.data")
                }
        }
        .frame(width: length, height: length, alignment: .center)
    }
    func BoardImage() -> String {
        var a = "WhiteKing"
        switch selected[index] {
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
        return a
    }
    
}
/*
struct SquareView_Previews: PreviewProvider {
    static var previews: some View {
        SquareView()
    }
}
*/
