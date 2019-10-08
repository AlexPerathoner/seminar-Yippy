//
//  YippyHistoryView.swift
//  Yippy
//
//  Created by Matthew Davidson on 2/10/19.
//  Copyright © 2019 MatthewDavidson. All rights reserved.
//

import Foundation
import Cocoa

class YippyHistoryView: NSCollectionView {
    
    var selected: Int? {
        return selectionIndexPaths.first?.item
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        commonInit()
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        
        commonInit()
    }
    
    private func commonInit() {
        layer?.backgroundColor = .clear
        allowsEmptySelection = false
        allowsMultipleSelection = false
        setAccessibilityIdentifier(Accessibility.identifiers.yippyCollectionView)
        
        let flowLayout = NSCollectionViewFlowLayout()
        flowLayout.sectionInset = sectionInset
        flowLayout.minimumLineSpacing = 5.0
        collectionViewLayout = flowLayout
        layer?.backgroundColor = NSColor.black.cgColor
    }
    
    func selectItem(_ i: Int) {
        if let selected = selected {
            deselectItem(selected)
        }
        let items = Set(arrayLiteral: IndexPath(item: i, section: 0))
        selectItems(at: items, scrollPosition: .nearestHorizontalEdge)
    }
    
    func deselectItem(_ i: Int) {
        deselectItems(at: Set(arrayLiteral: IndexPath(item: i, section: 0)))
    }
}
