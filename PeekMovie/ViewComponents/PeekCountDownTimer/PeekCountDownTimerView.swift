//
//  PeekCountDownTimerView.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 08.12.2023.
//

import UIKit


protocol PeekCountDownTimerViewDelegate: AnyObject {
    func finishedCountDown()
}


final class PeekCountDownTimerView: UIView {
    
    enum CountDownType {
        case contextual
        case separate
    }
    
    enum CountDownEndingType {
        case empty
        case placeholder
    }
    
    
    weak var delegate: PeekCountDownTimerViewDelegate?
    
//    var isContextual: Bool
    
    private(set) var seconds: Int
    private(set) var type: CountDownType
    private(set) var endingType: CountDownEndingType
    
    lazy var timerLabel = PeekLabel(
        type: .secondary,
        text: type == .contextual ? Constants.timerLabelContextualDefault : Constants.timerLabelDefault,
        font: .caption1
    )
    
    private var timer: Timer
    
    
//    MARK: lifecycle
    init(isContextual: Bool = true, type: CountDownType = .contextual, endingType: CountDownEndingType = .empty) {
//        self.isContextual = isContextual
        self.type = type
        self.endingType = endingType
        self.seconds = Constants.defaultSecondsAmount
        self.timer = .init()
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
//        self.isContextual = true
        self.type = .contextual
        self.endingType = .empty
        self.seconds = Constants.defaultSecondsAmount
        self.timer = .init()
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
        
        static let timerInterval: TimeInterval = 1
        
        static let unitText = "sec"
        static let empty = ""
        static let space = " "
        static let emptySeconds = "__"
        static let contextualText = "in"
        static let timerLabelDefault = emptySeconds + space + unitText
        static let timerLabelContextualDefault = contextualText + space + timerLabelDefault
        
    }
}


extension PeekCountDownTimerView {
    
    func startCountDown(from newSeconds: Int? = nil) {
        if let newSeconds = newSeconds {
            self.seconds = newSeconds
        }
        
        if self.seconds == .zero {
            self.seconds = Constants.defaultSecondsAmount
        }
        
        startTimer()
    }
    
    func stopCountDown() {
        seconds = .zero
        updateLabel(finished: true)
        timer.invalidate()
    }
    
    func pauseCountDown() {
        timer.invalidate()
    }
    
    func resumeCountDown() {
        startTimer()
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: Constants.timerInterval,
            target: self,
            selector: #selector(updateTimer),
            userInfo: nil, repeats: true
        )
    }
    
    @objc func updateTimer() {
        if seconds > 0 {
            seconds -= 1
            updateLabel()
        } else if seconds <= .zero {
            stopCountDown()
            delegate?.finishedCountDown()
        }
    }
    
    private func updateLabel(finished: Bool = false) {
        if finished {
            
            switch (endingType, type) {
                
            case (.empty, _):
                timerLabel.text = Constants.empty
                
            case (.placeholder, .contextual):
                timerLabel.text = Constants.timerLabelContextualDefault
                
            case (.placeholder, .separate):
                timerLabel.text = Constants.timerLabelDefault
                
            }
            
        } else {
//            timerLabel.text = (type == .contextual ? Constants.contextualText + Constants.space : Constants.empty) + "\(seconds)" + Constants.space + Constants.unitText
            
            switch (type, endingType) {
                
            case (.contextual, _):
                timerLabel.text = Constants.contextualText + Constants.space + "\(seconds)" + Constants.space + Constants.unitText
                
            case (.separate, _):
                timerLabel.text = Constants.empty + "\(seconds)" + Constants.space + Constants.unitText
                
            }
            
        }
    }
    
}
