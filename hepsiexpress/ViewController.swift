//
//  ViewController.swift
//  hepsiexpress
//
//  Created by Emir Alkal on 9.06.2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var buttons: [UIButton]!
    
    var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        for button in buttons {
            setConfigure(button)
        }
        
        products.append(Product(name: "Ayran", image: UIImage(named: "ayran")!, kind: ""))
        products.append(Product(name: "Baklava", image: UIImage(named: "baklava")!, kind: ""))
        products.append(Product(name: "Fanta", image: UIImage(named: "fanta")!, kind: ""))
        products.append(Product(name: "Kahve", image: UIImage(named: "kahve")!, kind: ""))
        
        let ui = UICollectionViewFlowLayout()
        ui.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        ui.minimumLineSpacing = 10
        ui.minimumInteritemSpacing = 10
        
        let width = collectionView.frame.size.width
        let cellWidth = (width) / 3
        ui.itemSize = CGSize(width: cellWidth, height: cellWidth * 1.7)
        
        collectionView.collectionViewLayout = ui
    }

    func setConfigure(_ button: UIButton) {
        button.tintColor = .black
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.cornerRadius = 15
    }
    
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        for button in buttons {
            if sender != button {
                button.tintColor = .black
                button.layer.borderColor = UIColor.lightGray.cgColor
            } else {
                sender.layer.borderColor = UIColor.systemGreen.cgColor
                sender.tintColor = .systemGreen
            }
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCollectionViewCell
        
        cell.productName.text = products[indexPath.row].name
        cell.productImage.image = products[indexPath.row].image
        
        return cell
    }
    
    
    
}

