//
//  AyAiWalletHeadViewSwiftUI.swift
//  AyAiApp
//
//  Created by 岸涌科技 on 2026/1/15.
//

import SwiftUI

struct AyAiWalletHeadViewSwiftUI: View {
    var body: some View {
        VStack(spacing: 0) {
            WalletBalanceCard(balance: "16,080")
                .padding(.horizontal, 16)
                .padding(.top, 16)

            BalanceRecordHeader()
                .padding(.top, 16)
            
            AdaptiveGrid()
                .padding(.top, 16)
                .padding(.horizontal, 0)
        }
        .background(
            RoundedRectangle(cornerRadius: 0)
                .fill(.gray)
        )
    }
}


struct WalletBalanceCard: View {
    let balance: String

    var body: some View {
        HStack {
            // 左侧内容
            VStack(alignment: .leading, spacing: 8) {
                Text("钱包余额")
                    .font(.system(size: 14))
                    .foregroundColor(.white)

                HStack(alignment: .center, spacing: 0) {
                    Image("coin_28") // 占位，换成你的 AI 金币图
                        .resizable()
                        .frame(width: 28, height: 28)
                    Text(balance)
                        .font(.system(size: 36, weight: .medium))
                        .foregroundColor(.white)
                        .lineLimit(1)
                }.frame(height: 48)
            }

            Spacer()

            // 右侧按钮
            Button {
                print("充值")
            } label: {
                Text("余额充值")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.red)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(
                        Capsule()
                            .fill(Color.white)
                    )
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, minHeight: 120)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color(.red))
        )
    }
}


struct BalanceRecordHeader: View {
    var body: some View {
        HStack(spacing: 4) {
            RoundedRectangle(cornerRadius: 2)
                .fill(.red)
                .frame(width: 4, height: 16)

            Text("余额记录")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.red)

            Spacer()
        }
        .padding(.horizontal, 16)
    }
}


struct AdaptiveGrid: View {
    let items = [1, 2, 3, 4, 5, 6]
    
    var body: some View {
        GeometryReader { geometry in
            let width = (geometry.size.width-20) / 3 // 按屏幕宽度分三列
            // 横向 spacing（列间距） → GridItem(spacing:)
            // 纵向 spacing（行间距） → LazyVGrid(spacing:)
            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: width), spacing: 10)],
                spacing: 30
            ) {
                ForEach(items, id: \.self) { item in
                    CellView(width: width, item: item)
                }
            }
        }
    }
}

struct CellView : View {
    var width: CGFloat = 0
    var item : Int = 0
    var body: some View {
        Text("\(item)")
            .frame(width: width, height: width*0.8)
            .foregroundColor(.red)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(.blue)
        )
    }
    
}
