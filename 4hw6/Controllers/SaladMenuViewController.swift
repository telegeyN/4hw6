//
//  ViewController.swift
//  4hw6
//
//  Created by Telegey Nurbekova on 29/02/24.
//

import UIKit

class SaladMenuViewController: UIViewController {
    
    private var items: [Item] = []
    private var sections: [Section] = []
    private let saladLabel = MakerView().makerLabel(text: "Salad")
    private let searchButton = MakerView().makerButton(backgroundColor: .clear, image: UIImage(systemName: "magnifyingglass")?.withRenderingMode(.alwaysTemplate))

    
    private let collectionViewFirst: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.width / 2.5)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.clipsToBounds = false
        return cv
    }()
    private let sortLabel = MakerView().makerLabel(text: "Sort by")
    private let sortButton = MakerView().makerButton(backgroundColor: .clear, image: UIImage(systemName: "arrow.up.arrow.down")?.withRenderingMode(.alwaysTemplate))
    private let methodLabel = MakerView().makerLabel(text: "Most Popular",font: .systemFont(ofSize: 16, weight: .semibold), textColor: .init(hex: "#f5484a"))
    private let collectionViewSecond: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 30, height: (UIScreen.main.bounds.width / 2 - 30) * 1.3)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateDetails()
        updateDetailsForSections()
        setUpUI()
    }
    
    private func setUpUI(){
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(saladLabel)
        NSLayoutConstraint.activate([
            saladLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 0),
            saladLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 18)
        ])
        
        searchButton.tintColor = UIColor.black
        view.addSubview(searchButton)
        NSLayoutConstraint.activate([
            searchButton.centerYAnchor.constraint(equalTo: saladLabel.centerYAnchor),
            searchButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -13),
            searchButton.heightAnchor.constraint(equalToConstant: 26),
            searchButton.widthAnchor.constraint(equalToConstant: 26)
        ])
        
        view.addSubview(collectionViewFirst)
        NSLayoutConstraint.activate([
            collectionViewFirst.topAnchor.constraint(equalTo: saladLabel.bottomAnchor,constant: 18),
            collectionViewFirst.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionViewFirst.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 13),
            collectionViewFirst.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -13),
            collectionViewFirst.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.5)
        ])
        collectionViewFirst.dataSource = self
        collectionViewFirst.register(HorizontalCollectionViewCell.self, forCellWithReuseIdentifier:"cell")
        
        view.addSubview(sortLabel)
        NSLayoutConstraint.activate([
            sortLabel.topAnchor.constraint(equalTo: collectionViewFirst.bottomAnchor,constant: 18),
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
        
        view.addSubview(collectionViewSecond)
        
        NSLayoutConstraint.activate([
            collectionViewSecond.topAnchor.constraint(equalTo: sortLabel.bottomAnchor, constant: 20),             collectionViewSecond.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionViewSecond.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionViewSecond.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
        
        collectionViewSecond.dataSource = self
        collectionViewSecond.register(VerticalCollectionViewCell.self, forCellWithReuseIdentifier:"cell2")
        
        
    }
    
    private func updateDetails(){
        
        items  = [Item(logo: UIImage(named: "salad1"), name: "Elevated Greek salad bowl", icon: UIImage(named:"icon1"), person: "Willard Purnell"),
                  Item(logo: UIImage(named: "salad2"), name: "Pear salad", icon: UIImage(named: "icon2"), person: "Jane Cooper"),
                  Item(logo: UIImage(named: "salad3"), name: "Italian Chopped Salad", icon: UIImage(named: "icon3"), person: "Elle Kai"),
                  Item(logo: UIImage(named: "salad4"), name: "Arugula Salad with Lemon Vinaigrette", icon: UIImage(named: "icon4"), person: "Zion Reynolds"),
                  Item(logo: UIImage(named: "salad5"), name: "Homemade Caesar Salad", icon: UIImage(named: "icon5"), person: "Kate Rey"),
                  Item(logo: UIImage(named: "salad6"), name: "Bright Spring Salad", icon: UIImage(named: "icon6"), person: "Will Gosling"),
                  Item(logo: UIImage(named: "salad7"), name: "Healthy Taco Salad", icon: UIImage(named: "icon7"), person: "Tom Godly"),
                  Item(logo: UIImage(named: "salad8"), name: "Tortellini Salad", icon: UIImage(named: "icon8"), person: "Emma Stawn")
        ]
    }
    
    private func updateDetailsForSections(){
        sections = [
            Section(logo: UIImage(named: "icon"), name: "Salad", quantity: "16.278 recipes"),
            Section(logo: UIImage(named: "burger"), name: "Burger", quantity: "15.942 recipes"),
            Section(logo: UIImage(named: "pizza"), name: "Pizza", quantity: "14.385 recipes"),
            Section(logo: UIImage(named: "noodles"), name: "Noodles", quantity: "15.293 recipes"),
            Section(logo: UIImage(named: "beef"), name: "Beef", quantity: "12.849 recipes"),
            Section(logo: UIImage(named: "chicken"), name: "Chicken", quantity: "13.248 recipes"),
            Section(logo: UIImage(named: "sushi"), name: "Sushi", quantity: "10.683 recipes"),
            Section(logo: UIImage(named: "rice"), name: "Rice", quantity: "16.843 recipes"),
            Section(logo: UIImage(named: "seafood"), name: "Seafood", quantity: "13.585 recipes"),
            Section(logo: UIImage(named: "cake"), name: "Cake", quantity: "16.846 recipes"),
            Section(logo: UIImage(named: "soup"), name: "Soup", quantity: "13.585 recipes"),
            Section(logo: UIImage(named: "bread"), name: "Bread", quantity: "13.852 recipes")
        ]
    }
}

extension SaladMenuViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == collectionViewFirst {
            return sections.count
        } else {
            return items.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == collectionViewFirst {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HorizontalCollectionViewCell
            cell.setData(sections: sections[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! VerticalCollectionViewCell
            cell.setData(items: items[indexPath.row])
            return cell
        }
    }
    
}

