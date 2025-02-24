//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Dmitry Batorevich on 10.01.2025.
//

import UIKit

final class StatisticService: StatisticServiceProtocol {
    private let storage: UserDefaults = .standard
    private enum Keys: String {
        case correctAnswers
        case gamesCount
        case bestGameСorrect
        case bestGameTotal
        case bestGameDate
        case totalAccuracy
    }
    
    var gamesCount: Int {
        get {storage.integer(forKey: Keys.gamesCount.rawValue)}
        set {storage.set(newValue, forKey: Keys.gamesCount.rawValue)}
    }
    
    var correctAnswers: Int {
        get {storage.integer(forKey: Keys.correctAnswers.rawValue)}
        set {storage.set(newValue, forKey: Keys.correctAnswers.rawValue)}
    }
    
    var bestGame: GameResult {
        get {
            let correct = storage.integer(forKey: Keys.bestGameСorrect.rawValue)
            let total = storage.integer(forKey: Keys.bestGameTotal.rawValue)
            let date = storage.object(forKey: Keys.bestGameDate.rawValue) as? Date ?? Date()
            return GameResult(correct: correct, total: total, date: date)
        }
        set(newValue) {
            storage.set(newValue.correct, forKey: Keys.bestGameСorrect.rawValue)
            storage.set(newValue.total, forKey: Keys.bestGameTotal.rawValue)
            storage.set(newValue.date, forKey: Keys.bestGameDate.rawValue)
        }
    }
    
    var totalAccuracy: Double {
        get {storage.double(forKey: Keys.totalAccuracy.rawValue)}
        set {storage.set(newValue, forKey: Keys.totalAccuracy.rawValue)}
    }
    
    func store(correct count: Int, total amount: Int) {
        let newRecord = GameResult(correct: count, total: amount, date: Date())
        if newRecord.isBetterThan(bestGame) {
            bestGame = newRecord
        }
        gamesCount += 1
        correctAnswers += count
        if gamesCount != 0 {
            totalAccuracy = Double(correctAnswers) / (Double(gamesCount * 10)) * 100
        }
    }
}
