//
//  DetailScreen.swift
//  MovieApp
//
//  Created by Cansu Kahraman on 1.10.2022.
//

import SwiftUI

struct DetailScreen: View {
    
    let detail: DetailModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            PosterImageView(path: detail._backdropPath)
            
            VStack(alignment: .leading, spacing: 30) {
                
                HStack{
                    HStack(spacing: 8) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        
                        Text(detail._voteAverage)
                    }
                    Spacer()
                    
                    HStack {
                        Text("\(detail._runtime) minutes")
                    }
                }
                
                Text(detail._title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                
                Spacer()
                Text(detail._overview)
                    .font(.body)
                    .padding(28)
                Spacer(minLength: 60)
                
                VStack (spacing: 10){
                    HStack {
                        Text("Release Date: ")
                        Text(detail._releaseDate)
                    }
                    
                    HStack {
                        Text("Genres: ")
                        Text(detail._genres.joined(separator: ", "))
                    }
                    
                }.frame(maxWidth:.infinity)
                    .padding()
                    .foregroundColor(Color.gray.opacity(0.8))
                
            }
                
                
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
            }
            .overlay(alignment: .topLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .padding(10)
                        .background {
                            Circle()
                                .fill(.white)
                                .shadow(radius: 10)
                        }
                }
                .contentShape(Circle())
                .foregroundColor(.black)
                .padding(20)
                .padding(.top, 10)
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
        }
    }


struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen(detail: DetailModel.mockData)
            .preferredColorScheme(.dark)
    }
}
