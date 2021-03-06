//
//  Followers+CollectionViewDelegate.swift
//  TwitterClient
//
//  Created by Ahmed Elassuty on 12/24/16.
//  Copyright © 2016 Eventtus. All rights reserved.
//

import UIKit

extension FollowersViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return !dataSource.isEmpty && !dataSource.isFetching
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let follower = dataSource[indexPath.item]
        let followerProfileViewController = FollowerProfileViewController(for: follower)
        present(followerProfileViewController, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Calculate the height of the bio
        let layout      = collectionViewLayout as! UICollectionViewFlowLayout
        let leftInset   = layout.sectionInset.left
        let rightInset  = layout.sectionInset.right
        var width       = collectionView.bounds.width - leftInset - rightInset
        
        if dataSource.isEmpty {
            return CGSize(width: width, height: 200)
        }
        
        if collectionView.bounds.width > collectionView.bounds.height {
            width /= 2
            width -= layout.minimumInteritemSpacing
        }
        
        let height = FollowerCollectionViewCell.heightThatFits(user: dataSource[indexPath.item], width: width)
        return CGSize(width: width, height: height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.bounds.maxY == scrollView.contentSize.height {
            dataSource.loadNextPageIfPossible()
        }
    }
    
}
