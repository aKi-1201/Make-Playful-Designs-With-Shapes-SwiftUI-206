//
//  ContentView.swift
//  MakePlayfulDesignsWithShapesSwiftUI206
//
//  Created by SHIH-YING PAN on 2025/9/9.
//

import SwiftUI

struct CurvedTriangle: Shape {      //貓耳朵
    /// 0~1，數值越大，弧線往上凹得越多
    var controlOffset: CGFloat = 0.5
    
    func path(in rect: CGRect) -> Path {
        let top = CGPoint(x: rect.midX, y: rect.minY)
        let left = CGPoint(x: rect.minX, y: rect.maxY)
        let right = CGPoint(x: rect.maxX, y: rect.maxY)
        
        // 控制點：貼近左右邊，往上拉
        let controlRight = CGPoint(x: rect.maxX, y: rect.maxY * (1 - controlOffset))
        let controlLeft  = CGPoint(x: rect.minX, y: rect.maxY * (1 - controlOffset))
        
        var p = Path()
        p.move(to: left)
        p.addLine(to: right)                         // 底邊
        p.addQuadCurve(to: top, control: controlRight) // 右側弧線
        p.addQuadCurve(to: left, control: controlLeft) // 左側弧線
        p.closeSubpath()
        return p
    }
}

struct ContentView: View {
    var body: some View {
        ZStack {
            // full-screen background
            Color.black.ignoresSafeArea()

            Circle()    //外框
                .frame(width: 250, height: 250)
                .foregroundStyle(.white)
            Capsule()   //頭
                .frame(width: 165, height: 125)
                .offset(y: -5)
            Capsule()   //身體
                .frame(width: 60, height: 115)
                .offset(y: 105)
            CurvedTriangle()    //右耳
                .frame(width: 50, height: 40)
                .offset(x:18, y: -85)
                .rotationEffect(.degrees(30))
            CurvedTriangle()    //左耳
                .frame(width: 50, height: 40)
                .offset(x:-18, y: -85)
                .rotationEffect(.degrees(-30))
            Circle()    //尾巴
                .trim(from: 0.2, to: 0.42)
                .stroke(.black, lineWidth: 13)
                .frame(width: 50, height: 50)
                .offset(x:-36, y: 60)
            Circle()    //尾巴
                .trim(from:0.75 , to: 0.92)
                .stroke(.black, lineWidth: 12)
                .frame(width: 50, height: 50)
                .offset(x:-80, y: 85)
            Circle()    //尾巴
                .frame(width: 12, height: 12)
                .offset(x:-80, y: 60)

            Rectangle() //身體與外框連結弧線（左）
                .frame(width: 12, height: 12)
                .offset(x:-30, y: 120)
            Circle()    //身體與外框連結弧線（左）
                .foregroundStyle(.white)
                .frame(width: 12, height: 12)
                .offset(x:-36, y: 113)

            Rectangle() //身體與外框連結弧線（右）
                .frame(width: 12, height: 12)
                .offset(x:30, y: 120)
            Circle()    //身體與外框連結弧線（右）
                .foregroundStyle(.white)
                .frame(width: 12, height: 12)
                .offset(x:36, y: 113)

            Text("GitHub")
                .font(Font.custom("Mona Sans", size: 50).weight(.bold))
                .foregroundStyle(.white)
                .offset(y: 200)

        }
    }
}

#Preview {
    ContentView()
}
