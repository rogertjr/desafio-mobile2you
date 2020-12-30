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
                    GeometryReader{g in
                        Image("detail-header")
                            .resizable()
                            .offset(y: g.frame(in: .global).minY > 0 ? -g.frame(in: .global).minY : 0 )
                            .frame(height: g.frame(in: .global).minY > 0 ? UIScreen.main.bounds.height / 2.2 + g.frame(in: .global).minY : UIScreen.main.bounds.height / 2.2)

                    }
                    .frame(height: UIScreen.main.bounds.height / 2.2)
                    
                    VStack(alignment: .leading){
                        HStack {
                            Text("Fight Club")
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Button(action: {
                                self.like.toggle()
                            }) {
                                Image(systemName: self.like ? "heart.fill" : "heart")
                                    .font(.system(size: 20))
                                    .foregroundColor(.primary)
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
                }
            }
        })
        .edgesIgnoringSafeArea(.top)
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
