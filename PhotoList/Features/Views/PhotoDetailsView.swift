//
//  PhotoDetailsView.swift
//  PhotoList
//
//  Created by Tricia Lorrainne Rullan Dela Cruz on 10/10/23.
//

import SwiftUI

struct PhotoDetailsView: View {
    @StateObject var viewModel: PhotoDetailsViewModel
    
    var body: some View {
        VStack {
            Text("N/A")
                .font(.title)
            
            Text("Age: Unknown")
            Text("Occupation: N/A")
            Spacer()
        }
        .padding()
        .navigationBarTitle("USER DETAILS")
        .onAppear {
            //viewModel.fetchProfile()
        }
    }
}

struct PhotoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoDetailsView(viewModel: PhotoDetailsViewModel(photo: Photo(id: 1, name: "Test")))
    }
}
