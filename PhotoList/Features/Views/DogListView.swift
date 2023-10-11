//
//  DogListView.swift
//  PhotoList
//
//  Created by Tricia Lorrainne Rullan Dela Cruz on 10/10/23.
//

import SwiftUI
import Combine

struct DogListView: View {
    
    @StateObject var viewModel: DogListViewModel
    let didTapRow = PassthroughSubject<Dog, Never>()
    
    var body: some View {
        switch viewModel.state {
        case .loading:
            loaderView()
        case let .failed(error):
            messageView(message: error.localizedDescription)
        case let .loaded(dogs):
            NavigationView {
                List(dogs) { dog in
                    PhotoRowView(dog: dog)
                        .frame(height: 100)
                        .onTapGesture {
                            didTapRow.send(dog)
                        }
                        .listRowSeparator(.hidden)
                }
            }
            .navigationBarTitle(Text(R.string.localizable.dogs))
        case .empty:
            messageView(message: R.string.localizable.noAvailableList())
        }
    }
}

private extension DogListView {
    func loaderView() -> some View {
        ZStack {
            Color.black.opacity(0.05)
                .ignoresSafeArea()
            ProgressView()
                .scaleEffect(1, anchor: .center)
                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
        }
    }
    
    func messageView(message: String) -> some View {
        VStack(alignment: .center) {
            Text(message)
                .font(.headline.bold())
                .multilineTextAlignment(.center)
            Spacer()
        }
        .padding()
    }
}

struct PhotoListView_Previews: PreviewProvider {
    static var previews: some View {
        DogListView(viewModel: DogListViewModel())
    }
}
