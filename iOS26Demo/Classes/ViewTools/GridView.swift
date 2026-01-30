//
//  SwiftUIView.swift
//  iOS26Demo
//
//  Created by 岸涌科技 on 2026/1/16.
//

import SwiftUI

/// 通用 GridView（框架层）
/// - 职责：
///   - 管列数
///   - 管横向 / 纵向 spacing
///   - 管数据驱动
///   - 不关心 Cell 内容
struct GridView<Data, Content>: View
where Data: RandomAccessCollection, Data.Element: Identifiable, Content: View {

    private let columns: Int
    private let columnSpacing: CGFloat
    private let rowSpacing: CGFloat
    private let data: Data
    private let content: (Data.Element) -> Content

    init(
        columns: Int,
        columnSpacing: CGFloat = 8,
        rowSpacing: CGFloat = 8,
        data: Data,
        @ViewBuilder content: @escaping (Data.Element) -> Content
    ) {
        self.columns = columns
        self.columnSpacing = columnSpacing
        self.rowSpacing = rowSpacing
        self.data = data
        self.content = content
    }

    var body: some View {
        LazyVGrid(
            columns: Array(
                repeating: GridItem(.flexible(), spacing: columnSpacing),
                count: columns
            ),
            spacing: rowSpacing
        ) {
            ForEach(data) { item in
                content(item)
            }
        }
    }
}
