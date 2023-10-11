//
//  HomeView.swift
//  PhotoList
//
//  Created by Tricia Lorrainne Rullan Dela Cruz on 11/10/23.
//

import SwiftUI
import Combine

enum HomeItem {
    case dogs
    
    var title: String {
        switch self {
        case .dogs:
            return R.string.localizable.dogs()
        }
    }
}

struct HomeView: View {
    let didTapMenuItem = PassthroughSubject<HomeItem, Never>()
    @State var menuItems: [HomeItem] = [.dogs]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(menuItems, id: \.self) { item in
                    Button(action: {
                        didTapMenuItem.send(item)
                    }) {
                        Text(item.title)
                    }
                }
            }
            .navigationBarTitle(R.string.localizable.list())
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
