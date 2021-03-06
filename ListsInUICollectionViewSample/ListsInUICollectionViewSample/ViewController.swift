//
//  ViewController.swift
//  ListsInUICollectionViewSample
//
//  Created by home on 2021/03/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // セクションの種類
    enum Section {
        case main
    }
    
    // 表示するデータ
    let colorNames = ["red", "blue", "green", "yellow", "black", "white"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

