//
//  PasswordRestorationViewController+CountDownTimerView.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 09.12.2023.
//

import UIKit


extension PasswordRestorationViewController: PeekCountDownTimerViewDelegate {
    func finishedCountDown() {
        viewComponents.secondaryButton.isEnabled = true
    }
}
