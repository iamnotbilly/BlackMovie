//
//  ViewModel.swift
//  BlackMoviee
//
//  Created by Black Billy on 21/3/24.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var showDetail: Bool = false
    @Published var popularMovies: [Movie] = []
    @Published var topRatedMovies: [Movie] = []
    @Published var upcomingMovies: [Movie] = []
    @Published var nowPlayingMovies: [Movie] = []
    @Published var allMovies: [Movie] = []
    
    init() {
        getPopularMovies()
        getTopRatedMovies()
        getUpcomingMovies()
        getNowPlayingMovies()
    }
    
    func getPopularMovies() {
        guard let url = URL(string: Endpoint.popular.fullPath) else {return}
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {return}
            do{
                let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                let movies = movieResponse.results
                DispatchQueue.main.async {
                    self?.popularMovies = movies
                    self?.getAllMovies()
                }
            } catch {
                print(error as Any)
            }
        }
        task.resume()
    }
    func getTopRatedMovies() {
        guard let url = URL(string: Endpoint.topRated.fullPath) else {return}
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {return}
            do{
                let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                let movies = movieResponse.results
                DispatchQueue.main.async {
                    self?.topRatedMovies = movies
                    self?.getAllMovies()
                }
            } catch {
                print(error as Any)
            }
        }
        task.resume()

    }
    func getUpcomingMovies() {
        guard let url = URL(string: Endpoint.upcoming.fullPath) else {return}
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {return}
            do{
                let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                let movies = movieResponse.results
                DispatchQueue.main.async {
                    self?.upcomingMovies = movies
                    self?.getAllMovies()
                }
            } catch {
                print(error as Any)
            }
        }
        task.resume()
    }
    func getNowPlayingMovies() {
        guard let url = URL(string: Endpoint.nowPlaying.fullPath) else {return}
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {return}
            do{
                let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                let movies = movieResponse.results
                DispatchQueue.main.async {
                    self?.nowPlayingMovies = movies
                    self?.getAllMovies()
                }
            } catch {
                print(error as Any)
            }
        }
        task.resume()
    }
    
    func getAllMovies() {
        allMovies = popularMovies + topRatedMovies + upcomingMovies + nowPlayingMovies
    }
}
