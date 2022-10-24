//
//  HomeScreen.swift
//  MovieApp
//
//  Created by Cansu Kahraman on 30.09.2022.
//

import SwiftUI

struct HomeScreen: View {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some View {
        VStack {
            searchBarView
            
            if vm.movies.isEmpty {
                Spacer()
                Text("Search some movie 🥳")
                Spacer()

            } else {
                moviesListView
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal:  .move(edge: .trailing)))
            }
        }
        .navigationTitle("Movies 🎬")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    withAnimation {
                        vm.movies.removeAll()
                    }
                } label: {
                    Image(systemName: "trash.fill")
                        .foregroundColor(.red)
                }
            }
        }
        .background {
            NavigationLink(isActive: $vm.showDetail) {
                if let detail = vm.detail {
                    DetailScreen(detail: detail)
                }
            } label: {}
        }
    }
    
    var searchBarView: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search movie", text: $vm.searchText)
                .disableAutocorrection(true)
                .onSubmit {
                
                }
        }
        .padding()
        .background(Color.gray.opacity(0.3))
        .cornerRadius(10)
        .padding()
    }
    
    var moviesListView: some View {
        List(vm.movies) { movie in
            Button {
                vm.getDetail(id: movie._id)
            } label: {
                HStack(alignment: .top) {
                    PosterImageView(path: movie.posterPath ?? "")
                        .scaledToFill()
                        .frame(width: 100, height: 150)
                        .cornerRadius(10)
                        
                    
                    VStack(alignment: .leading, spacing: 30) {
                        Text("\(movie._title)")
                        
                        Text("\(movie._releaseDate)")
                    }
                }
            }
        }
        .listStyle(.inset)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
