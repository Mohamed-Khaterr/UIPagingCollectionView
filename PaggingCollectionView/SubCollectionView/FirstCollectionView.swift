//
//  FirstCollectionView.swift
//  PaggingCollectionView
//
//  Created by Khater on 4/1/23.
//

import UIKit


class FirstCollectionView: UICollectionView {
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        register(UICollectionViewCell.self, forCellWithReuseIdentifier: "FirstCell")
        dataSource = self
        delegate = self
//        isScrollEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



// MARK: - UICollectionView DataSource
extension FirstCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: "FirstCell", for: indexPath)
        cell.backgroundColor = .red
        
        cell.subviews.forEach({ $0.removeFromSuperview() })
        let label = UILabel(frame: cell.bounds)
        label.textColor = .black
        label.textAlignment = .center
        label.text = String(indexPath.row)
        cell.addSubview(label)
        
        return cell
    }
}



// MARK: - UICollectionView Delegate
extension FirstCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("DidSelectItem in First CollectionView at IndexPath:", indexPath)
    }
}



// MARK: - UICollectionView Delegate FlowLayout
extension FirstCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 8) / 2, height: collectionView.frame.height / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}
