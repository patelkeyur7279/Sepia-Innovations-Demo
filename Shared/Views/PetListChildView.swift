//
//  PetListChildView.swift
//  Sepia Innovations Demo
//
//  Created by Keyur Patel on 13/12/22.
//

import SwiftUI

struct PetListChildView: View {
    
    @State var pet: Pet
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                AsyncImage(url: URL(string: pet.image_url)){ image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Image(systemName: "photo.fill")
                }
                .frame(width: 100, height: 100)
                .clipped()
                .cornerRadius(5)
                .shadow(radius: 5)
                
                VStack(alignment: .leading) {
                    Text(pet.title)
                        .font(.title)
                    Text(pet.addedDate)
                        .font(.footnote)
                }
                
            }
        }
    }
}

struct PetListChildView_Previews: PreviewProvider {
    static var previews: some View {
        PetListChildView(pet: Pet.example())
    }
}
