//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Dmitry Batorevich on 08.01.2025.
//

import UIKit

struct AlertModel {
   //заголовок алерта
    let title: String
    //сообщение алерта
    let message: String
    //текст кнопки алерта
    let buttonText: String
    //Замыкание
    let buttonPress: (() -> Void)?
}
