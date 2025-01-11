//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Dmitry Batorevich on 10.01.2025.
//

import UIKit

final class StatisticService: StatisticServiceProtocol {
    
    private let userDefaults: UserDefaults = .standard
    
    private enum Keys: String {
        case correct
        case total
        case bestGame
        case gamesCount
    }
    
    var gamesCount: Int {
        get {
            return userDefaults.integer(forKey: Keys.gamesCount.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: Keys.gamesCount.rawValue)
        }
    }
    
    var bestGame: GameResult {
        get {
            guard let data = userDefaults.data(forKey: Keys.bestGame.rawValue),
                  let result = try? JSONDecoder().decode(GameResult.self, from: data) else {
                return .init(correct: 0, total: 0, date: Date())
            }
            return result
        }
        set {
            guard let data = try? JSONEncoder().encode(newValue) else {
                return
            }
            userDefaults.set(data, forKey: Keys.bestGame.rawValue)
        }
        
    }
    
    var totalAccuracy: Double {
        get {
            userDefaults.double(forKey: Keys.total.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: Keys.total.rawValue)
        }
    }
    
    func store(correct count: Int, total amount: Int) {
        let newRecord = GameResult(correct: count, total: amount, date: Date())
        if newRecord.isBetterThan(bestGame) {
            bestGame = newRecord
        }
        gamesCount += 1
        let totalCorrectAnswers = bestGame.correct + count
        let totalQuestions: Int = bestGame.total + amount
        if totalQuestions != 0 {
            totalAccuracy = Double(totalCorrectAnswers) / Double(totalQuestions)
        }
    }
}
