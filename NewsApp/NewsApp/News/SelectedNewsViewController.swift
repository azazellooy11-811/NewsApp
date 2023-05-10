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
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        return scrollView
    }()
    
    private lazy var contentView: UIView = UIView()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy  var descriptionText: UILabel = {
        let textView = UILabel()
        textView.numberOfLines = 0
        return textView
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // MARK: - Properties
    private let viewModel: NewsViewModelProtocol
    
    // MARK: - Life Cycle
    init(viewModel: NewsViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        setupUI()
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(imageView)
        contentView.addSubview(descriptionText)
        contentView.addSubview(timeLabel)
        
        titleLabel.text = viewModel.title
        descriptionText.text = viewModel.description
        timeLabel.text = viewModel.date
        
        if let data = viewModel.imageData,
            let image = UIImage(data: data) {
            imageView.image = image
        } else {
            imageView.image = UIImage(named: "image")
        }
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()//.width.equalTo(view.safeAreaLayoutGuide)
            //make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.width.edges.equalToSuperview()//.equalTo(view.safeAreaLayoutGuide)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(view.safeAreaLayoutGuide).inset(5)
        }
        
        imageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(5)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.height.equalTo(view.snp.width)
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
