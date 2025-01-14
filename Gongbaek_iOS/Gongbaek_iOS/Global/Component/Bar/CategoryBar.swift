//
//  CategoryBar.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/15/25.
//

import SwiftUI

struct CategoryBar: View {
    @State private var selectedCategory: CategoryImageState = .all

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 6) {
                ForEach(CategoryImageState.allCases, id: \.self) { category in
                    CategoryButton(
                        text: category.categoryName,
                        isSelcted: selectedCategory == category
                    ) {
                        selectedCategory = category
                    }
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    CategoryBar()
}
