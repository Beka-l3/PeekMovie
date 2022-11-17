//
//  Movie.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 31.10.2022.
//

struct MovieDTO: Codable {
    let movieId: String
    let rating: Float
    let url: String
    let img: String
    let title: String
    let summary: String
    let year: Int
    let prod: String
}
