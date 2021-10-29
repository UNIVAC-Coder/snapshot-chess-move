//
//  SquareView3.swift
//  Shared
//  Creative Commons Attribution 4.0 International Public License
//  Creative Commons may be contacted at creativecommons.org.
//
//  Copyright (c) 2021 Thomas Cavalli
//  Thomas Cavalli may be contacted at thomascavalli.com
//
//  List of What Changed (by Who and When):
//  Created by Thomas Cavalli on 10/12/21.
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
