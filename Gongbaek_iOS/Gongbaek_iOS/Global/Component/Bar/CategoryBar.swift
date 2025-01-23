//
//  CategoryBar.swift
//  Gongbaek_iOS
//
//  Created by 김민서 on 1/15/25.
//

import SwiftUI

import SwiftUI

struct CategoryBar: View {
    @ObservedObject var viewModel: FillingViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 6) {
                ForEach(CategoryState.allCases, id: \.self) { category in
                    CategoryButton(
                        text: category.categoryName,
                        isSelcted: viewModel.selectedCategory == category
                    ) {
                        viewModel.selectedCategory = category
                        viewModel.getFillling() 
                    }
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    let viewModel = FillingViewModel()
    CategoryBar(viewModel: viewModel)
}


#Preview {
    let viewModel = FillingViewModel()
    CategoryBar(viewModel: viewModel)
}
