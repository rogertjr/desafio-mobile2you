//
//  MovieDetailView.swift
//  Desafio M2Y
//
//  Created by Rogério Toledo on 29/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieDetailView: View {
    
    // MARK: - PROPERTIES
    static let movieID = 550
    
    @State var like = false
    @ObservedObject var vm = MovieViewModel(movieID: movieID)
    
    // MARK: - BODY
    var body: some View {
        if self.vm.isLoading {
            // MARK: - LOADER
            ProgressView("Loading ...")
        } else {
            ZStack(alignment: .top, content: {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        // MARK: -  TOPO
                        ZStack{ // HERO IMAGE
                            GeometryReader { geometry in
                                AnimatedImage(url: self.vm.movieDetails?.poster.map {MovieService.imageBase.appendingPathComponent($0)})
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: geometry.size.width, height: self.getCoverHeight(geometry))
                                    .clipped()
                                    .offset(x: 0, y: self.getCoverOffset(geometry))
                            }
                            
                            Rectangle()
                            .foregroundColor(.clear)
                            .background(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom))
                        } //: ZSTACK
                        .frame(height: UIScreen.main.bounds.height / 2.2)
                        
                        // MARK: - MIDDLE
                        VStack(alignment: .leading){
                            HStack { // TITLE LABEL
                                Text(self.vm.movieDetails?.title ?? "")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.yellow)
                                
                                Spacer()
                                
                                // LIKE BUTTON
                                Button(action: {
                                    self.like.toggle()
                                }) {
                                    Image(systemName: self.like ? "heart.fill" : "heart")
                                        .font(.system(size: 20))
                                        .foregroundColor(.yellow)
                                }
                            } //: HSTACK
                            
                            Spacer(minLength: 0)
                            
                            HStack(){
                                HStack{
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.gray)
                                    
                                    HStack(spacing: 5){
                                        Text(String(self.vm.movieDetails?.votes ?? 0))
                                        Text("Likes")
                                    } //: HSTACK
                                    .foregroundColor(.gray)
                                } //: HSTACK
                                
                                HStack {
                                    Image(systemName: "video")
                                        .foregroundColor(.gray)
                                    
                                    HStack(spacing: 5){
                                        Text(String(self.vm.movieDetails?.popularity ?? 0))
                                        Text("Views")
                                    } //: HSTACK
                                        .foregroundColor(.gray)
                                } //: HSTACK
                                .padding(.leading)
                            } //: HSTACK
                            .padding(.top)
                            
                            VStack(spacing: 20) {
                                // SIMILAR MOVIES LIST
                                ForEach(vm.movieSimilarMovieList){ movie in
                                    MovieDetailCardView(data: movie)
                                }
                            } //: VSTACK
                            .padding(.top)
                        }  //: VSTACK
                        .padding()
                        
                        Spacer()
                        // MARK: - BOTTOM
                        VStack{ // ACTION BUTTONS
                            Button(action: { self.like.toggle() }) {
                                HStack {
                                    Image(systemName: self.like ? "heart.fill" : "heart")
                                        .font(.system(size: 16))
                                        .foregroundColor(self.like ? .black : .yellow)

                                    Text(self.like ? "Liked" : "Like")
                                        .font(.system(size: 16))
                                        .foregroundColor(self.like ? .black : .yellow)
                                } //: HSTACK
                                .frame(maxWidth: .infinity)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.yellow, lineWidth: 1)
                                )
                                .background(self.like ? .yellow : Color.clear)
                                .padding(.leading)
                                .padding(.trailing)
                            } //: BUTTON
                            
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
                            } //: BUTTON
                        }
                        .padding(.bottom, 20)
                        
                        // PROJECT LABELS
                        VStack{
                            HStack{
                                Text("Made with")
                                    .foregroundColor(.yellow)
                                
                                Image(systemName: "heart.fill")
                                    .foregroundColor(.yellow)
                                
                                Text("by Rogério Toledo")
                                    .fontWeight(.bold)
                                    .foregroundColor(.gray)
                            } //: HSTACK
                            
                            Text("Desafio Mobile2You")
                                .foregroundColor(.yellow)
                                .padding(.top, 10)
                        } //: VSTACK
                        .padding(.bottom, 40)
                        
                    }  //: VSTACK
                } //: SCROLLVIEW
            }) //: ZSTACK
            .edgesIgnoringSafeArea(.all)
        }
    }
    
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
