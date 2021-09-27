//
//  ButtonImageView.swift
//  MyMusic
//
//  Created by YUKI on 2021/09/27.
//

import SwiftUI

struct ButtonImageView: View {
    // 画像ファイル名
    let imageName: String
    
    var body: some View {
        // 画像を表示する
        Image(imageName)
            // ボタン内の画像をカラー画像となるように指定する
            .renderingMode(.original)
    }
}

struct ButtonImageView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonImageView(imageName: "cymbal")
    }
}
