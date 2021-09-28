//
//  ContentView.swift
//  MyTimer
//
//  Created by YUKI on 2021/09/28.
//

import SwiftUI

struct ContentView: View {
    // タイマーの変数を作成
    @State var timerHandler : Timer?
    // カウント(経過時間)の変数を作成
    @State var count = 0
    // 永続化する秒数設定(初期値は10)
    // AppStorage: データを永続化するUserDefaultsから値を読み込む
    @AppStorage("timer_value") var timerValue = 10
    
    var body: some View {
        NavigationView {
            ZStack {
                // 背景画像
                Image("backgroundTimer")
                    .resizable()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                
                //垂直方向にレイアウト
//                View(部品)間の感覚を30にする
                VStack(spacing: 30.0) {
                    Text("残り\(timerValue - count)秒")
                        // 文字サイズを指定
                        .font(.largeTitle)
                    
                    // 水平方向にレイアウト
                    HStack {
                        // スタートボタン
                        Button(action: {
                            // ボタンをタップした時のアクション
                            // タイマーをカウントダウン開始する関数を呼び出す
                            startTimer()
                        }) {
                            Text("スタート")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .frame(width: 140, height: 140)
                                .background(Color("startColor"))
                                // 円形に切り抜く
                                .clipShape(Circle())
                        }
                        
                        // ストップボタン
                        Button(action: {
                            // ボタンをタップした時のアクション
                            // timerHandlerをアンラップしてunwrapedTimerHandlerに代入
                            if let unwrapedTimerHandler = timerHandler {
                                // もしタイマーが実行中だったら停止
                                if unwrapedTimerHandler.isValid == true {
                                    // タイマー停止
                                    unwrapedTimerHandler.invalidate()
                                }
                            }
                        }) {
                            Text("ストップ")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .frame(width: 140, height: 140)
                                .background(Color("stopColor"))
                                .clipShape(Circle())
                        }
                    }
                }
            }
            // 画面が表示されるときに実行される
            .onAppear {
                // カウント(経過時間)の変数を初期化
                count = 0
            }
            // ナビゲーションバーにボタンを追加
            // navigationBarItems: 画面上部のナビゲーションバー部分のレイアウト
            .navigationBarItems(trailing: // trailing: 画面右端に寄せる
                // ナビゲーション遷移
                NavigationLink(
                    destination: SettingView()) {
                    // テキスト表示
                    Text("秒数設定")
                }
            )
        }
    }
    
    // 1秒毎に実行されてカウントダウンする
    func countDownTimer() {
        // count(経過時間)に+1していく
        count += 1
        
        // 残り時間が0以下の時、タイマーを止める
        if timerValue - count <= 0 {
            // タイマー停止
            timerHandler?.invalidate()
        }
    }
    
    // タイマーをカウントダウン開始する関数
    func startTimer() {
        // timerHandlerをアンラップしてunwrapedTimerHandlerに代入
        if let unwrapedTimerHandler = timerHandler {
            // もしタイマーが実行中だったらスタートしない
            if unwrapedTimerHandler.isValid == true {
                return
            }
        }
        
        // 残り時間が0以下の時、count(経過時間)を0に初期化する
        if timerValue - count <= 0 {
            // count(経過時間)を0にする
            count = 0
        }
        
        // タイマーをスタート
        timerHandler = Timer.scheduledTimer(withTimeInterval: 1, repeats:true ) {
            _ in
            // タイマー実行時に呼び出される
            // 1秒毎に実行されてカウントダウンする関数を実行する
            countDownTimer()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
