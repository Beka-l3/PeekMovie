//
//  PeekTapHandlerView.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 06.12.2023.
//

import UIKit


protocol PeekTapHandlerViewDelegate: AnyObject {
    func tapped()
}


final class PeekTapHandlerView: UIView {
    
    weak var delegate: PeekTapHandlerViewDelegate?
    
    private lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        UITapGestureRecognizer(target: self, action: #selector(handleTap))
    }()
    
    
//    MARK: lifecycle
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
//    MARK: @objc func
    @objc func handleTap() {
        delegate?.tapped()
    }
    
    
//    MARK: private func
    private func setupView() {
        backgroundColor = .clear
        addGestureRecognizer(tapGestureRecognizer)
    }
    
}
