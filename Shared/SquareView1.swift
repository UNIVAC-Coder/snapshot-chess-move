//
//  SquareView.swift
//  Shared
//
//  Created by Thomas Cavalli on 10/5/21.
//

import SwiftUI

struct SquareView1: View {
    var length:  CGFloat
    @Binding var piecesColor: Bool
    var BGcolor: Bool
    @Binding var selected2: [Int]
    
    var body: some View {
        ZStack {
            Image(piecesColor ? "Black52" : "White52")
                .resizable()
                .frame(width: length, height: length, alignment: .center)
                .onTapGesture {
                    change()
                }
            Text(piecesColor ? "Black" : "White")
                .onTapGesture {
                    change()
                }
        }
        .frame(width: length, height: length, alignment: .center)
    }
    func change() {
        piecesColor.toggle()
        if piecesColor {
            selected2 = [1,2,3,4,5,6]
        }else{
            selected2 = [9,10,11,12,13,14]
        }
    }
}
/*
struct SquareView_Previews: PreviewProvider {
    static var previews: some View {
        SquareView()
    }
}
*/
