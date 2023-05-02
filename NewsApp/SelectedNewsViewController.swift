//
//  SelectedNewsViewController.swift
//  NewsApp
//
//  Created by Азалия Халилова on 01.05.2023.
//

import UIKit
import SnapKit

final class SelectedNewsViewController: UIViewController {
    // MARK: - GUI Variables
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image")
        return imageView
    }()
    
    private lazy  var descriptionText: UILabel = {
        let textView = UILabel()
        textView.text = "Description"
        return textView
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "11:11:11"
        return label
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(descriptionText)
        view.addSubview(timeLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(view.safeAreaLayoutGuide).inset(5)
        }
        
        imageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(5)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
        
        descriptionText.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(5)
            make.top.equalTo(imageView.snp.bottom).offset(20)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(5)
            make.top.equalTo(descriptionText.snp.bottom).offset(10)
        }
    }
}
