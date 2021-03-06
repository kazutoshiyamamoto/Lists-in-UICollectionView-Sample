//
//  ViewController.swift
//  ListsInUICollectionViewSample
//
//  Created by home on 2021/03/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    // セルをUICollectionViewに提供するために使用するオブジェクト
    var dataSource: UICollectionViewDiffableDataSource<Section, String>! = nil
    
    // セクションの種類
    enum Section {
        case main
    }
    
    // 表示するデータ
    let colorNames = ["red", "blue", "green", "yellow", "black", "white"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // リストのレイアウトの設定
        let configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        // すべてのセクションでconfigurationの設定を使用する
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        collectionView.collectionViewLayout = layout
        
        // セルを登録
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, String> { (cell, indexPath, item) in
            var content = cell.defaultContentConfiguration()
            content.text = item
            cell.contentConfiguration = content
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, String>(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, item: String) -> UICollectionViewCell? in
            
            // 再利用可能なセルを返す
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
        }
        
        // UICollectionViewにデータを提供する構造体
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        // セクションを追加
        snapshot.appendSections([.main])
    }
}

