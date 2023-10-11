//
//  PhotoRowView.swift
//  PhotoList
//
//  Created by Tricia Lorrainne Rullan Dela Cruz on 11/10/23.
//

import SwiftUI

struct PhotoRowView: View {
    var dog: Dog
    
    var body: some View {
        HStack {
            AsyncImage(
                url: URL(string: dog.image_link),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150,
                               height: 100)
                        .cornerRadius(3)
                },
                placeholder: {
                    ProgressView()
                }
            )
            Text(verbatim: dog.name)
                .font(.title3)
            Spacer()
        }
    }
}

struct PhotoRowView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoRowView(dog: Dog(image_link: "https://api-ninjas.com/images/dogs/maltese.jpg",
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
                                  name: "Maltese"))
    }
}
