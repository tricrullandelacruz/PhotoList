//
//  PhotoListView.swift
//  PhotoList
//
//  Created by Tricia Lorrainne Rullan Dela Cruz on 10/10/23.
//

import SwiftUI
import Combine

struct PhotoListView: View {
    @StateObject var viewModel: PhotoListViewModel
    let didClickUser = PassthroughSubject<Photo, Never>()
    
    var body: some View {
        NavigationView {
            List(viewModel.users) { user in
                Button(action: {
                    didClickUser.send(user)
                }) {
                    Text(user.name)
                }
            }
            .navigationBarTitle("Users")
            .onAppear {
                viewModel.fetchUsers()
            }
        }
    }
}

struct PhotoListView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoListView(viewModel: PhotoListViewModel())
    }
}
