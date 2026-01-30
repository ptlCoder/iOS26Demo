//
//  ProductGridView.swift
//  iOS26Demo
//
//  Created by 岸涌科技 on 2026/1/16.
//

import SwiftUI

struct ProductGridView: View {
    
    let products: [Product]?

    private let columns = 2
    
    var body: some View {
        GridView(columns: columns, columnSpacing: 8, rowSpacing: 16, data: products ?? []) { product in
            ProductCell(product: product)
        }
    }
}

struct Product: Identifiable, Equatable {

    let id: String
    let title: String
    let imageURL: String
    let price: Decimal
}

struct ProductCell: View {

    let product: Product

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {

            AsyncImage(url: URL(string: product.imageURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.2)
            }
            .frame(height: 140)
            .clipped()
            .cornerRadius(12)

            Text(product.title)
                .font(.system(size: 14, weight: .medium))
                .lineLimit(2)

            Text("¥\(product.price)")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.red)
        }
    }
}
