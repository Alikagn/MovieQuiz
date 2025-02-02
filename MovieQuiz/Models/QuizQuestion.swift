//
//  QuizQuestion.swift
//  MovieQuiz
//
//  Created by Dmitry Batorevich on 05.01.2025.
//

import Foundation

struct QuizQuestion {
    //Строка с названием фильма,
    //совпадает с названием картинки афиши фильма в Assets
    let image: String
    //строка с вопросом о рейтинге фильма
    let text: String
    //булево значения (true, false), правильный ответ на вопрос
    let correctAnswer: Bool
}
