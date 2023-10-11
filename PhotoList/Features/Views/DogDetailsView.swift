//
//  DogDetailsView.swift
//  PhotoList
//
//  Created by Tricia Lorrainne Rullan Dela Cruz on 10/10/23.
//

import SwiftUI

struct DogDetailsView: View {
    @StateObject var viewModel: DogDetailsViewModel
    
    var body: some View {
        detailsView()
    }
}

private extension DogDetailsView {
    func detailsView() -> some View {
        ScrollView(.vertical) {
            VStack(spacing: 20) {
                AsyncImage(
                    url: URL(string: viewModel.dog?.image_link ?? ""),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300,
                                   height: 200)
                            .cornerRadius(3)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                Text(verbatim: viewModel.dog?.name ?? "")
                    .font(.largeTitle)
                detailsInfoView()
            }
        }
        .padding()
        .navigationBarTitle(Text(viewModel.dog?.name ?? ""))
    }
    
    func detailsInfoView() -> some View {
        return VStack(spacing: 5) {
            Text(R.string.localizable.goodWithStrangers(viewModel.dog?.good_with_strangers ?? 0))
            Text(R.string.localizable.playfulness(viewModel.dog?.playfulness ?? 0))
            Text(R.string.localizable.protectiveness(viewModel.dog?.protectiveness ?? 0))
            Text(R.string.localizable.trainability(viewModel.dog?.trainability ?? 0))
            Text(R.string.localizable.energy(viewModel.dog?.energy ?? 0))
            Text(R.string.localizable.maxLifeExpectancy(viewModel.dog?.max_life_expectancy ?? 0))
            Text(R.string.localizable.minLifeExpectancy(viewModel.dog?.min_life_expectancy ?? 0))
            Spacer()
        }
    }
    
}
struct PhotoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DogDetailsView(viewModel: DogDetailsViewModel(
            dog: Dog(image_link: "https://api-ninjas.com/images/dogs/maltese.jpg",
                     good_with_children: 1,
                     good_with_other_dogs: 1,
                     shedding: 1, grooming: 1,
                     drooling: 1,
                     coat_length: 1,
                     good_with_strangers: 1,
                     playfulness: 1,
                     protectiveness: 1,
                     trainability: 1,
                     energy: 1,
                     barking: 1,
                     min_life_expectancy: 1,
                     max_life_expectancy: 1,
                     max_height_male: 1,
                     max_height_female: 1,
                     max_weight_male: 1,
                     max_weight_female: 1,
                     min_height_male: 1,
                     min_height_female: 1,
                     min_weight_male: 1,
                     min_weight_female: 1,
                     name: "Maltese")))
    }
}
