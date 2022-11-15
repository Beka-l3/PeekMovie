//
//  WaitingPagePickerViewExtension.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 14.11.2022.
//

import UIKit


extension WaitingPage: UIPickerViewDataSource, UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat { 40 }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        self.usernames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let title = NSMutableAttributedString(
            string: self.usernames[row],
            attributes: [
                NSAttributedString.Key.foregroundColor: row == 0 ? yellow : white,
                NSAttributedString.Key.font : row == 0 ? detailFont : infoFont
            ]
        )
        
        return title
    }
}
