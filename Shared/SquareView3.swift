//
//  SquareView3.swift
//  Shared
//
//  Created by Thomas Cavalli on 10/12/21.
//  Optional to add Who, When and What Changed:
//

import SwiftUI

struct SquareView3: View {
    var length: CGFloat
    @Binding var boarderColor: Int //0 = none, 1 = green, 2 = red
    var bgColor : Bool
        
    var body: some View {
        ZStack {
            Image(boarderColor == 1 ? "Green52" : boarderColor == 2 ? "Red52" : bgColor ? "White52" : "Black52")
                .resizable()
                .frame(width: length, height: length, alignment: .center)
                .onTapGesture {
                    change()
                }
            Image( bgColor ? "White52" : "Black52" )
                .resizable()
                .frame(width: length * 0.9, height: length * 0.9, alignment: .center)
                .onTapGesture {
                    change()
                }
            Text(boarderColor == 0 ? "Click To Move" : boarderColor == 1 ? "From Green" : "To Red")
                .onTapGesture {
                    change()
                }
        }
    .frame(width: length, height: length, alignment: .center)
    }
    
    func change() {
        boarderColor += 1
        if boarderColor > 2 {
            boarderColor = 0
        }
    }
}
/*
struct SquareView3_Previews: PreviewProvider {
    static var previews: some View {
        SquareView3()
    }
}
*/
