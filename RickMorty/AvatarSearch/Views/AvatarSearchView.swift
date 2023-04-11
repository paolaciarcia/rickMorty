//
//  AvatarSearchView.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 31/03/23.
//

import UIKit

final class AvatarSearchView: UIView {
    var didSelectStatus: ((_ isSelected: Bool) -> Void)?
    var didTapFilter: (() -> Void)?

    private let dataSource = AvatarSearchDataSource()

    private var bottomButtonConstraint = NSLayoutConstraint()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.name
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 21, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = L10n.textFieldDefaultName
        textField.backgroundColor = .secondarySystemFill
        textField.layer.cornerRadius = 4
        textField.clearButtonMode = .whileEditing
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.status
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 21, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let collectionViewLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width
        flowLayout.minimumLineSpacing = 20
        flowLayout.itemSize = CGSize(width: width * 0.2, height: 34)
        return flowLayout
    }()

    private lazy var statusCollectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collection.register(AvatarSearchViewCell.self, forCellWithReuseIdentifier: String(describing: AvatarSearchViewCell.self))
        collection.dataSource = dataSource
        collection.delegate = dataSource
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection

    }()

    private lazy var filterButton: UIButton = {
        let button = UIButton()
        button.setTitle(L10n.filter, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(handleFilterButton), for: .touchUpInside)
        button.accessibilityIdentifier = "filterButton"
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    init() {
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        backgroundColor = .systemGray5
        setupViewHierarchy()
        setupConstraints()
        setupKeyboard()
    }

    private func setupViewHierarchy() {
        addSubview(nameLabel)
        addSubview(searchTextField)
        addSubview(statusLabel)
        addSubview(statusCollectionView)
        addSubview(filterButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            searchTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            searchTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            searchTextField.heightAnchor.constraint(equalToConstant: 45),

            statusLabel.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 40),
            statusLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            statusCollectionView.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 15),
            statusCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            statusCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            filterButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            filterButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
//            filterButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true,
            filterButton.heightAnchor.constraint(equalToConstant: 55)
        ])

        bottomButtonConstraint = filterButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
        bottomButtonConstraint.isActive = true
    }

    private func setupKeyboard() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }

    @objc
    private func keyboardWillShow(_ notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                let keyboardHeight = keyboardSize.height
            bottomButtonConstraint.constant -= keyboardHeight

            let userInfo = notification.userInfo
            let animationDuration = userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
            UIView.animate(withDuration: animationDuration) {
                self.layoutIfNeeded()
            }
        }
    }

    @objc
    private func keyboardWillHide(_ notification: NSNotification) {
        bottomButtonConstraint.constant = -20

        let userInfo = notification.userInfo
        let animationDuration = userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        UIView.animate(withDuration: animationDuration) {
            self.layoutIfNeeded()
        }
    }
    
    private func bindLayoutEvents() {

    }

    @objc
    private func handleFilterButton() {
        didTapFilter?()
    }



    func show() {
        statusCollectionView.reloadData()
    }
}

extension AvatarSearchView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing(true)
    }
}
