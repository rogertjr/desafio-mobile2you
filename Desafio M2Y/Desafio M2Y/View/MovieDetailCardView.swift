//
//  MovieDetailCardView.swift
//  Desafio M2Y
//
//  Created by Rogério Toledo on 29/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieDetailCardView: View {
    // MARK: - PROPERTIES
    var data : Movie
    
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 20) {
            AnimatedImage(url: data.poster.map {MovieService.imageBase.appendingPathComponent($0)})
                .resizable()
                .frame(width: 70, height: 100)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(data.title)
                    .fontWeight(.bold)
                    .foregroundColor(.yellow)
                
                HStack {
                    Text(data.date.onlyYear ?? "")
                        .font(.caption)
                        .foregroundColor(.yellow)
                    
                    Text("Genre")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            
            Spacer(minLength: 0)
        }
    }
    
}
