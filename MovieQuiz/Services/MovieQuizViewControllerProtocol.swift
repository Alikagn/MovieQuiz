//
//  MovieQuizViewControllerProtocol.swift
//  MovieQuiz
//
//  Created by Dmitry Batorevich on 12.03.2025.
//

import UIKit

protocol MovieQuizViewControllerProtocol: AnyObject {
   
    func showFirstScreen(quiz step: QuizStepViewModel)
    func show(quiz result: QuizResultsViewModel)
    
    func highlightImageBorder(isCorrectAnswer: Bool)
    
    func showLoadingIndicator()
    func hideLoadingIndicator()
    
    func showNetworkError(message: String)
}
