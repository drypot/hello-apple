//
//  CustomTextStorage.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 9/20/24.
//

import AppKit

// Mastering macOS programming-Packt Publishing (2017), 215p

class CustomTextStorage: NSTextStorage {
    
    let textContent = NSMutableAttributedString()
    
    override var string: String {
        return textContent.string
    }
    
    override func attributes(
        at location: Int,
        effectiveRange range: NSRangePointer?
    ) -> [NSAttributedString.Key: Any] {
        
        return textContent.attributes(
            at: location,
            effectiveRange: range)
    }
    
    override func replaceCharacters(
        in range: NSRange,
        with str: String
    ) {
            
        beginEditing()
        textContent.replaceCharacters(
            in: range,
            with: str)
        edited(
            [.editedCharacters, .editedAttributes],
            range: range,
            changeInLength: (str as NSString).length - range.length)
        endEditing()
    }
    
    override func setAttributes(
        _ attrs: [NSAttributedString.Key: Any]?,
        range: NSRange
    ) {
        beginEditing()
        textContent.setAttributes(
            attrs,
            range: range)
        edited(
            .editedAttributes,
            range: range,
            changeInLength: 0)
        endEditing()
    }

}
