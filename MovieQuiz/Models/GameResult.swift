//
//  GameResult.swift
//  MovieQuiz
//
//  Created by Dmitry Batorevich on 10.01.2025.
//

import Foundation

struct GameResult: Codable {
    let correct: Int
    let total: Int
    let date: Date
    
    func isBetterThan(_ another: GameResult) -> Bool {
        correct > another.correct
    }
}
