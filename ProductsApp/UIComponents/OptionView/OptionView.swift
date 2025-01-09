//
//  OptionView.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import Foundation
import UIKit

public class OptionView: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var optionButton: UIButton!
    
    // MARK: - Properties
    
    private var optionAction: (() -> Void)?
    
    public var isClickable: Bool = true {
        didSet {
            optionButton.isUserInteractionEnabled = isClickable
        }
    }
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initializeView()
    }
    
    // MARK: - Private Methods
    
    /// Initializes the view by loading it from the nib and setting up the content view.
    private func initializeView() {
        loadViewFromNib()
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        configureViewStyles()
        contentView.addShadow()
    }
    
    /// Loads the view from the nib.
    private func loadViewFromNib() {
        let nib = UINib(nibName: String(describing: OptionView.self), bundle: Bundle.main)
        nib.instantiate(withOwner: self, options: nil)
    }
    
    public func displayView(
        with viewData: OptionViewData,
        textColor: UIColor = ColorManager.shared.primary,
        action: (() -> Void)? = nil
    ) {
        setTitle(with: viewData.title)
        setTitleColor(with: textColor)
        isClickable = viewData.isClickable
        optionAction = action
    }
    
    public func setTitle(with text: String) {
        titleLabel.text = text
    }
    
    public func setTitleColor(with color: UIColor) {
        titleLabel.textColor = color
    }

    @IBAction func arrowOptionButtonTapped(_ sender: Any) {
        optionAction?()
    }
}

extension OptionView: ViewStylerProtocol {
    
    public func configureViewStyles() {
        titleLabel.font = .museoSansFont(type: .W500, size: 20)
    }
}
