//
//  ProfileViewController.swift
//  DelegateAndMVC
//
//  Created by ebpearls on 31/05/2023.
//

import UIKit
import Alamofire

class ProfileViewController: UIViewController {
    
    // MARK: - Properties
    private let screenView: ProfileView
    private let viewModel: ProfileViewModel
    
    var profileCoordinator: ProfileCoordinator?
    
    // MARK: - Initilization
    init(screenView: ProfileView, viewModel: ProfileViewModel) {
        self.screenView = screenView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Controlller Life Cycle
    override func loadView() {
        super.loadView()
        view = screenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - setup
    private func setup() {
        viewModel.getDataUsingAloma()
        setupCollectionView()
        observeEvents()
    }
    
    private func observeEvents() {
        viewModel.productObtained = { [weak self] in
            guard let self = self else { return }
            self.configure()
        }
    }
    
    // MARK: - setupCollectionView
    private func setupCollectionView() {
        screenView.collectionView.dataSource = self
        screenView.collectionView.delegate = self
        screenView.collectionView.isPagingEnabled = true
        
        screenView.pageControl.addTarget(self, action: #selector(pageControlValueChanged(_:)), for: .valueChanged)
    }
    
    // MARK: - pageControlValueChanged
    @objc private func pageControlValueChanged(_ sender: UIPageControl) {
        let indexPath = IndexPath(row: sender.currentPage, section: 0)
        screenView.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    // MARK: - reloadTable
    private func reloadCollectionView() {
        DispatchQueue.main.async {
            self.screenView.collectionView.reloadData()
        }
    }
    
    // MARK: - configure
    func configure() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self,
                  let product = self.viewModel.product
            else {
                debugPrint("product is nil")
                return
            }
            
            self.screenView.fetchedUserIdLabel.text = "\(product.productId)"
            self.screenView.fetchedNameLabel.text = product.productTitle
            self.screenView.fetchedEmailLabel.text = product.productDescription
            self.screenView.fetchedgenderLabel.text = "\(product.productPrice)"
            self.screenView.pageControl.numberOfPages = product.images.count
            self.screenView.pageControl.currentPage = 0
            
            self.reloadCollectionView()
        }
    }
}

// MARK: - UICollectionViewDataSource
extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.product?.images.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ProfileViewCell = collectionView.dequeueCollectionCell(for: indexPath)
        cell.configure(image: viewModel.product?.images[indexPath.row] ?? "")
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screenView.collectionView.bounds.width, height: 200)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: self.screenView.collectionView.contentOffset, size: self.screenView.collectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = self.screenView.collectionView.indexPathForItem(at: visiblePoint) {
            self.screenView.pageControl.currentPage = visibleIndexPath.item
        }
    }
}

