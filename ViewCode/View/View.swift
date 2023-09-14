//
//  View.swift
//  ViewCode
//
//  Created by COTEMIG on 30/08/23.
//

import UIKit

class View : UIView {
    
    private lazy var testeLabel : UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("Erro")
    }
    
}
