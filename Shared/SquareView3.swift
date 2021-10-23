//
//  SquareView3.swift
//  Shared
//  MIT License
//
//  Copyright (c) 2021 Thomas Cavalli
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//
//  Optional List of What Changed by Who and When.
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
