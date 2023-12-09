//
//  PeekCountDownTimerView.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 08.12.2023.
//

import UIKit


final class PeekCountDownTimerView: UIView {
    
    private(set) var seconds: Int
    
    var isContextual: Bool
    
    lazy var timerLabel = PeekLabel(
        type: .secondary,
        text: isContextual ? Constants.timerLabelContextualDefault : Constants.timerLabelDefault,
        font: .caption1
    )
    
    
//    MARK: lifecycle
    init(isContextual: Bool = true) {
        self.isContextual = isContextual
        self.seconds = Constants.defaultSecondsAmount
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        self.isContextual = true
        self.seconds = Constants.defaultSecondsAmount
        super.init(coder: coder)
    }
    
    
//    MARK: private func
    private func setupView() {
        backgroundColor = .clear
        
        addSubview(timerLabel)
        
        NSLayoutConstraint.activate([
            timerLabel.topAnchor.constraint(equalTo: topAnchor),
            timerLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            timerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            timerLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}


extension PeekCountDownTimerView {
    enum Constants {
        
        static let defaultSecondsAmount = 60
        
        static let unitText = "sec"
        static let timerLabelDefault = "__" + " " + unitText
        static let timerLabelContextualDefault = "in" + " " + "__" + " " + unitText
        
    }
}


extension PeekCountDownTimerView {
    
    func startCountDown() {
        
    }
    
    func stopCountDown() {
        
    }
    
    func pauseCountDown() {
        
    }
    
    func resumeCountDown() {
        
    }
    
}
