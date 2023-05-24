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
        scrollView.contentSize = self.view.frame.size

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
        
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        
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
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.trailing.leading.equalTo(view.safeAreaLayoutGuide).inset(5)
                        make.top.equalToSuperview()
                }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview().inset(5)
        }
        
        imageView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(titleLabel)
                        make.top.equalTo(titleLabel.snp.bottom).offset(10)
                        make.height.equalTo(view.snp.width)
        }
        
        descriptionText.snp.makeConstraints { make in
            make.leading.trailing.equalTo(imageView)
                        make.top.equalTo(imageView.snp.bottom).offset(20)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(descriptionText)
                        make.top.equalTo(descriptionText.snp.bottom).offset(10)
        }
    }
}
