//
//  ViewController.swift
//  UITabbarDemo
//
//  Created by Aaron on 2022/11/20.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        estimateItemSizeToZero()
        
        addSearchController()
    }
    
    func addSearchController() {
        self.navigationItem.title = "Search"
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search..."
        searchController.searchResultsUpdater = self
        self.navigationItem.searchController = searchController
    }
    
    func estimateItemSizeToZero() {
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = .zero
        }
    }
}

extension SearchViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultCell", for: indexPath) as? ResultCell else {
            return UICollectionViewCell()
        }
        
        let imageName = "animal\(indexPath.item + 1)"
        cell.configure(imageName)
        return cell
    }
}

extension SearchViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let iterItemSpacing: CGFloat = 1
        let width = (collectionView.bounds.width - iterItemSpacing * 2) / 3
        let height = width
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

extension SearchViewController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let search = searchController.searchBar.text
        print("Search: \(search)")
    }
    
    
}
