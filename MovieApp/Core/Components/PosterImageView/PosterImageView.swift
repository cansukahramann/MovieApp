//
//  PosterImageView.swift
//  MovieApp
//
//  Created by Cansu Kahraman on 1.10.2022.
//

import SwiftUI

struct PosterImageView: View {
    
    @StateObject private var vm: PosterImageViewModel
    
    init(path: String) {
        _vm = StateObject(wrappedValue: PosterImageViewModel(path: path))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .resizable()
            }
        }
    }
}

struct PosterImageView_Previews: PreviewProvider {
    static var previews: some View {
        PosterImageView(path:"/EX0ITg5YqDgFHjujpTNhEPaJSL.jpg")
    }
}
