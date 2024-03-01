//
//  ViewController.swift
//  4hw6
//
//  Created by Telegey Nurbekova on 29/02/24.
//

import UIKit

class SaladMenuViewController: UIViewController {
    
    private var items: [Item] = []
    private let saladLabel = MakerView().makerLabel(text: "Salad")
    private let searchButton = MakerView().makerButton(backgroundColor: .clear, image: UIImage(systemName: "magnifyingglass")?.withRenderingMode(.alwaysTemplate))
    private let saladImage = MakerView().makerImage(imageName: "icon")
    private let nameLabel = MakerView().makerLabel(text: "Salad",font: .systemFont(ofSize: 15, weight: .semibold), textColor: .white)
    private let quantityLabel = MakerView().makerLabel(text: "16.278 recipes",font: .systemFont(ofSize: 13, weight: .light), textColor: .white)
    private let sortLabel = MakerView().makerLabel(text: "Sort by")
    private let sortButton = MakerView().makerButton(backgroundColor: .clear, image: UIImage(systemName: "arrow.up.arrow.down")?.withRenderingMode(.alwaysTemplate))
    private let methodLabel = MakerView().makerLabel(text: "Most Popular",font: .systemFont(ofSize: 16, weight: .semibold), textColor: .init(hex: "#f5484a"))
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 30, height: 250)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateDetails()
        setUpUI()
    }
    
    private func setUpUI(){
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(saladLabel)
        NSLayoutConstraint.activate([
            saladLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 0),
            saladLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 13)
        ])
        
        searchButton.tintColor = UIColor.black
        view.addSubview(searchButton)
        NSLayoutConstraint.activate([
            searchButton.centerYAnchor.constraint(equalTo: saladLabel.centerYAnchor),
            searchButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -13),
            searchButton.heightAnchor.constraint(equalToConstant: 26),
            searchButton.widthAnchor.constraint(equalToConstant: 26)
        ])
        
        view.addSubview(saladImage)
        NSLayoutConstraint.activate([
            saladImage.topAnchor.constraint(equalTo: saladLabel.bottomAnchor,constant: 18),
            saladImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saladImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 13),
            saladImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -13),
            saladImage.heightAnchor.constraint(equalToConstant: 144)
        ])
        
        view.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: saladImage.bottomAnchor,constant: -43),
            nameLabel.leadingAnchor.constraint(equalTo: saladImage.leadingAnchor,constant: 8)
        ])
        
        view.addSubview(quantityLabel)
        NSLayoutConstraint.activate([
            quantityLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 4),
            quantityLabel.leadingAnchor.constraint(equalTo: saladImage.leadingAnchor,constant: 8)
        ])
        
        
        
        view.addSubview(sortLabel)
        NSLayoutConstraint.activate([
            sortLabel.topAnchor.constraint(equalTo: saladImage.bottomAnchor,constant: 18),
            sortLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 13)
        ])
        
        sortButton.tintColor = UIColor.init(hex: "#f5484a")
        view.addSubview(sortButton)
        NSLayoutConstraint.activate([
            sortButton.centerYAnchor.constraint(equalTo: sortLabel.centerYAnchor),
            sortButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -13),
            sortButton.heightAnchor.constraint(equalToConstant: 24),
            sortButton.widthAnchor.constraint(equalToConstant: 24)
        ])
        
        view.addSubview(methodLabel)
        NSLayoutConstraint.activate([
            methodLabel.centerYAnchor.constraint(equalTo: sortButton.centerYAnchor),
            methodLabel.trailingAnchor.constraint(equalTo: sortButton.leadingAnchor,constant: -5)
        ])
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: sortLabel.bottomAnchor, constant: 20),             collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
        
        collectionView.dataSource = self
        collectionView.register(SimpleCollectionViewCell.self, forCellWithReuseIdentifier:"cell")
        
    }
    
    private func updateDetails(){
        
        items  = [Item(logo: "salad1", name: "Elevated Greek salad bowl", icon: "icon1", person: "Willard Purnell"),
                  Item(logo: "salad2", name: "Pear salad", icon: "icon2", person: "Jane Cooper"),
                  Item(logo: "salad3", name: "Italian Chopped Salad", icon: "icon3", person: "Elle Kai"),
                  Item(logo: "salad4", name: "Arugula Salad with Lemon Vinaigrette", icon: "icon4", person: "Zion Reynolds"),
                  Item(logo: "salad5", name: "Homemade Caesar Salad", icon: "icon5", person: "Kate Rey"),
                  Item(logo: "salad6", name: "Bright Spring Salad", icon: "icon6", person: "Will Gosling"),
                  Item(logo: "salad7", name: "Healthy Taco Salad", icon: "icon7", person: "Tom Godly"),
                  Item(logo: "salad8", name: "Tortellini Salad", icon: "icon8", person: "Emma Stawn"),
        ]
    }
}

extension SaladMenuViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SimpleCollectionViewCell
        
        let item = items[indexPath.row]
        cell.setData(logo: item.logo, name: item.name, icon: item.icon, person: item.person)
        
        return cell
    }
    
}

