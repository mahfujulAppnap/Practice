//
//  CollectionViewController.swift
//  Practice
//
//  Created by Appnap Mahfuj on 29/11/23.
//

import UIKit

class CollectionViewController: UIViewController {

    //MARK: This will be our main data sources for colors
    var dataSources: [UIColor] = [.black, .white, .red, .yellow, .blue, .purple, .brown, .gray, .brown, .clear, .cyan, .darkGray, .green, .orange]
    //MARK: List Name
    let nameLable: UILabel = {
        let text = "hello"
        let label = UILabel()
        label.text = text
        label.textColor = .black
        label.backgroundColor = .white
        return label
    }()
    
    //MARK: Collection List
    let collectionView: UICollectionView = {
        let collection = UICollectionView()
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collection.backgroundColor = .white
        
        //MARK: CollectionVIew flow Layout Setup
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collection.collectionViewLayout = layout
        
        return collection
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Setup our name view
        nameLable.addSubview(view)
        nameLable.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        nameLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        nameLable.widthAnchor.constraint(equalToConstant: 150).isActive = true
        nameLable.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        //MARK: Setup our collection view
        collectionView.addSubview(view)
        collectionView.topAnchor.constraint(equalTo: nameLable.bottomAnchor, constant: 30).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 30).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 30).isActive = true
        
        //MARK: Setup out delegate to collection view to manipulation
        collectionView.delegate = self
        
        
        
        
        
        

        // Do any additional setup after loading the view.
    }
    
    

}
extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSources.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = dataSources[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: collectionView.frame.width, height: 50)
        return size
    }
    
    
}
