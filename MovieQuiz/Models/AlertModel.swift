//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Dmitry Batorevich on 08.01.2025.
//

import UIKit

struct AlertModel {
    let title: String
    let message: String
    let buttonText: String
    let buttonPress: (() -> Void)?
}
