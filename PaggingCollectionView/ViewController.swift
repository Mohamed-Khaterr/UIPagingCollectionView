//
//  ViewController.swift
//  PaggingCollectionView
//
//  Created by Khater on 3/22/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: PaignCollectionView Component
    @IBOutlet weak var pagingCollectionView: UIPagingCollectionView!
    
    
    // MARK: SubCollectionViews
    private let firstCollectionView = FirstCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let secondCollectionView = SecondCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let thirdCollectionView = ThirdCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        pagingCollectionView.pagingDelegate = self
        pagingCollectionView.pagingDataSource = self
    }
}




// MARK: - UIPagingCollectionView DataSource
extension ViewController: UIPagingCollectionViewDataSource {
    func pagingCollectionView(titleForHeaderButtons pagingCollectionView: UIPagingCollectionView) -> [String] {
        return ["First", "Second", "Third"]
    }
    
    func pagingCollectionView(subCollectionViews pagingCollectionView: UIPagingCollectionView) -> [UICollectionView] {
        return [firstCollectionView, secondCollectionView, thirdCollectionView]
    }
}


// MARK: - UIPagingCollectionView Delegate
extension ViewController: UIPagingCollectionViewDelegate {
    func pagingCollectionView(didScrollToCollectionViewAt index: Int) {
         print("Selected UICollectionView Index:", index)
    }
}
