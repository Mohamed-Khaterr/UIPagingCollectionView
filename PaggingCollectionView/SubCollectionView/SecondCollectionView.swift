//
//  SecondCollectionView.swift
//  PaggingCollectionView
//
//  Created by Khater on 4/1/23.
//

import UIKit


class SecondCollectionView: UICollectionView {
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        register(UICollectionViewCell.self, forCellWithReuseIdentifier: "SecondCell")
        dataSource = self
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



// MARK: - UICollectionView DataSource
extension SecondCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: "SecondCell", for: indexPath)
        cell.backgroundColor = .green
        
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
extension SecondCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("DidSelectItem in Second CollectionView at IndexPath:", indexPath)
    }
}



// MARK: - UICollectionView Delegate FlowLayout
extension SecondCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 8) / 3, height: collectionView.frame.height / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}
