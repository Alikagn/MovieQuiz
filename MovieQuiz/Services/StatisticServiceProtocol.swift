//
//  StatisticServiceProtocol.swift
//  MovieQuiz
//
//  Created by Dmitry Batorevich on 10.01.2025.
//

import UIKit

protocol StatisticServiceProtocol {
    var gamesCount: Int { get }
    var bestGame: GameResult { get }
    var totalAccuracy: Double { get }
    var correctAnswers: Int { get }
    
    func store(correct count: Int, total amount: Int)
}
