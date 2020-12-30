//
//  MovieDetailView.swift
//  Desafio M2Y
//
//  Created by Rogério Toledo on 29/12/20.
//

import SwiftUI

struct MovieDetailView: View {
    
    @State var like = false
 
    var body: some View {
        ZStack(alignment: .top, content: {
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ZStack{
                        GeometryReader { geometry in
                            Image("detail-header")
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width, height: self.getCoverHeight(geometry))
                                .clipped()
                                .offset(x: 0, y: self.getCoverOffset(geometry))
                        }
                        
                        Rectangle()
                        .foregroundColor(.clear)
                        .background(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom))
                    }
                    .frame(height: UIScreen.main.bounds.height / 2.2)
                    
                    VStack(alignment: .leading){
                        HStack {
                            Text("Fight Club")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.yellow)
                            
                            
                            Spacer()
                            
                            Button(action: {
                                self.like.toggle()
                            }) {
                                Image(systemName: self.like ? "heart.fill" : "heart")
                                    .font(.system(size: 20))
                                    .foregroundColor(.yellow)
                            }
                        }
                        
                        Spacer()
                        
                        HStack(){
                            HStack{
                                Image(systemName: "heart.fill")
                                    .foregroundColor(.gray)
                                
                                Text("999 likes")
                                    .foregroundColor(.gray)
                            }
                            
                            HStack {
                                Image(systemName: "circle")
                                    .foregroundColor(.gray)
                                
                                Text("Popularity")
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        VStack(spacing: 20) {
                            ForEach(data){ i in
                                MovieDetailCardView(data: i)
                            }
                        }
                        .padding(.top)
                    }
                    .padding()
                    
                    Spacer()
                    
                    VStack{
                        Button(action: { }) {
                            
                            HStack {
                                Image(systemName: "heart")
                                    .font(.system(size: 16))
                                    .foregroundColor(.yellow)

                                Text("Like")
                                    .font(.system(size: 16))
                                    .foregroundColor(.yellow)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.yellow, lineWidth: 1)
                            )
                            .padding(.leading)
                            .padding(.trailing)
                        }
                        
                        Button(action: { }) {
                            Text("Adicionar a Minha Lista")
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
                    .padding(.bottom, 20)
                    
                    
                    VStack{
                        HStack{
                            Text("Made with")
                                .foregroundColor(.yellow)
                            
                            Image(systemName: "heart.fill")
                                .foregroundColor(.yellow)
                            
                            Text("by Rogério Toledo")
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                        }
                        
                        Text("Desafio Mobile 2 You")
                            .foregroundColor(.yellow)
                    }
                    .padding(.bottom, 40)
                    
                }
            }
        })
        .edgesIgnoringSafeArea(.all)
    }
    
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


struct Relacionado: Identifiable {
    var id: Int
    var image: String
    var title: String
    var year: String
    var category: String
    
}

var data = [
    Relacionado(id: 0, image: "detail-header", title: "Clube da Luta", year: "1990", category: "Fight, Drama"),
    Relacionado(id: 0, image: "detail-header", title: "Clube da Luta", year: "1990", category: "Fight, Drama"),
    Relacionado(id: 0, image: "detail-header", title: "Clube da Luta", year: "1990", category: "Fight, Drama"),
    Relacionado(id: 0, image: "detail-header", title: "Clube da Luta", year: "1990", category: "Fight, Drama"),
    Relacionado(id: 0, image: "detail-header", title: "Clube da Luta", year: "1990", category: "Fight, Drama"),
    Relacionado(id: 0, image: "detail-header", title: "Clube da Luta", year: "1990", category: "Fight, Drama"),
    Relacionado(id: 0, image: "detail-header", title: "Clube da Luta", year: "1990", category: "Fight, Drama")
]
