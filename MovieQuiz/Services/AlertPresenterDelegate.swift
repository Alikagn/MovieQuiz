//
//  AlertPresenterDelegate.swift
//  MovieQuiz
//
//  Created by Dmitry Batorevich on 08.01.2025.
//

import UIKit

protocol AlertPresenterDelegate: AnyObject {
    func show(alert: UIAlertController)
}
