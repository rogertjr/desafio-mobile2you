//
//  MovieDetailView.swift
//  Desafio M2Y
//
//  Created by Rogério Toledo on 29/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieDetailView: View {
    
    // MARK: - VARIABLES AND CONSTANTS
    static let movieID = 550
    @ObservedObject var vm = MovieViewModel(movieID: movieID)
    
    var heroImageView: some View {
        ZStack {
            GeometryReader { geometry in
                AnimatedImage(url: vm.movieDetails?.poster.map {MovieService.imageBase.appendingPathComponent($0)})
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: getCoverHeight(geometry))
                    .clipped()
                    .offset(x: 0, y: getCoverOffset(geometry))
            }
            
            Rectangle()
            .foregroundColor(.clear)
            .background(LinearGradient(gradient: Gradient(colors: [.clear, Color(UIColor.systemBackground)]), startPoint: .top, endPoint: .bottom))
        }
        .frame(height: UIScreen.main.bounds.height / 2.2)
    }
    
    var titleLabel: some View {
        HStack {
            Text(vm.movieDetails?.title ?? "")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.yellow)
            
            Spacer()
            
            likeButton
        }
    }
    
    var likesLabel: some View {
        HStack {
            Image(systemName: "heart.fill")
                .foregroundColor(.gray)
            
            HStack(spacing: 5) {
                Text(String(vm.movieDetails?.votes ?? 0))
                Text("Likes")
            }
            .foregroundColor(.gray)
        }
    }
    
    var likeButton: some View {
        Button(action: { vm.like.toggle() }) {
            Image(systemName: vm.like ? "heart.fill" : "heart")
                .font(.system(size: 20))
                .foregroundColor(.yellow)
        }
    }
    
    var likeBottomButton: some View {
        Button(action: { vm.like.toggle() }) {
            HStack {
                Image(systemName: vm.like ? "heart.fill" : "heart")
                    .font(.system(size: 16))
                    .foregroundColor(vm.like ? .black : .yellow)

                Text(vm.like ? "Liked" : "Like")
                    .font(.system(size: 16))
                    .foregroundColor(vm.like ? .black : .yellow)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.yellow, lineWidth: 1)
            )
            .background(vm.like ? .yellow : Color.clear)
            .padding(.leading)
            .padding(.trailing)
        }
    }
    
    var viewsLabel: some View {
        HStack {
            Image(systemName: "video")
                .foregroundColor(.gray)
            
            HStack(spacing: 5){
                Text(String(vm.movieDetails?.popularity ?? 0))
                Text("Views")
            }
                .foregroundColor(.gray)
        }
    }
    
    var addToFavorites: some View {
        Button(action: { }) {
            Text("Add to My List")
                .font(.system(size: 16))
                .foregroundColor(.yellow)
                .frame(maxWidth: .infinity)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.yellow, lineWidth: 1)
                )
                .padding(.leading)
                .padding(.trailing)
        }
    }
    
    var projectLabels: some View {
        VStack {
            HStack {
                Text("Made with")
                    .foregroundColor(.yellow)
                
                Image(systemName: "heart.fill")
                    .foregroundColor(.yellow)
                
                Text("by Rogério Toledo")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            }
            
            Text("Desafio Mobile2You")
                .foregroundColor(.yellow)
                .padding(.top, 10)
        }
    }
    
    // MARK: - BODY
    var body: some View {
        if vm.isLoading {
            // MARK: - LOADER
            ProgressView("Carregando ...")
        } else {
            ZStack(alignment: .top, content: {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        // MARK: -  TOP
                        heroImageView
                        
                        // MARK: - MIDDLE
                        VStack(alignment: .leading) {
                            titleLabel
                            
                            Spacer(minLength: 0)
                            
                            HStack {
                                likesLabel
                                viewsLabel
                                .padding(.leading)
                            }
                            .padding(.top)
                            
                            VStack(spacing: 20) {
                                // SIMILAR MOVIES LIST
                                ForEach(vm.movieSimilarMovieList) { movie in
                                    MovieDetailCardView(data: movie)
                                }
                            }
                            .padding(.top)
                        }
                        .padding()
                        
                        Spacer()
                        
                        // MARK: - BOTTOM
                        
                        // ACTIONS BUTTONS
                        VStack {
                            likeBottomButton
                            addToFavorites
                        }
                        .padding(.bottom, 20)
                        
                        // PROJECT LABELS
                        projectLabels
                        .padding(.bottom, 40)
                        
                    }  //: VSTACK
                } //: SCROLLVIEW
            }) //: ZSTACK
            .edgesIgnoringSafeArea(.all)
        }
    }
}

extension MovieDetailView {
    // MARK: - FUNCTIONS
    private func getScrollOffset(_ geometry: GeometryProxy) -> CGFloat {
        geometry.frame(in: .global).minY
    }
        
    private func getCoverOffset(_ geometry: GeometryProxy) -> CGFloat {
        let offset = getScrollOffset(geometry)

        if offset > 0 {
            return -offset
        }
        
        return 0
    }
    
    private func getCoverHeight(_ geometry: GeometryProxy) -> CGFloat {
        let offset = getScrollOffset(geometry)
        let imageHeight = geometry.size.height

        if offset > 0 {
            return imageHeight + offset
        }

        return imageHeight
    }
}
