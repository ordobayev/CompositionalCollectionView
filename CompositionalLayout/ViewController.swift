//
//  ViewController.swift
//  CompositionalLayout
//
//  Created by Нургазы on 24/2/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.dataSource = self
        collectionView.collectionViewLayout = compositionalLayout()
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: "headerKind", withReuseIdentifier: "header")
    }
    
    func compositionalLayout() -> UICollectionViewCompositionalLayout {
        
        let layout = UICollectionViewCompositionalLayout { (section, _) -> NSCollectionLayoutSection? in
            if section == 0 {
                return self.firstSection()
            } else if section == 1 {
                return self.secondSection()
            } else if section == 2 {
                return self.thirdSection()
            } else if section == 3 {
                return self.fourthSection()
            } else if section == 4 {
                return self.fifthSection()
            } else {
                return nil
            }
        }
        
        return layout
    }
    
    func firstSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 2, leading: 8, bottom: 2, trailing: 8)
        
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(220))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.orthogonalScrollingBehavior = .paging
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
        
        section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalHeight(1.0), heightDimension: .absolute(50)), elementKind: "section-header-element-kind", alignment: .leading)]
        
        section.boundarySupplementaryItems = [header()]
        
        return section
    }
    
    func secondSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalHeight(1.0)))
        
        item.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(130))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets.leading = 3
        section.contentInsets.trailing = 3
        
        section.boundarySupplementaryItems = [header()]
        
        
        return section
    }
    
    func thirdSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        
        item.contentInsets = .init(top: 2, leading: 8, bottom: 2, trailing: 8)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(120)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.orthogonalScrollingBehavior = .continuous
        
        section.boundarySupplementaryItems = [header()]
        
        return section
        
    }
    
    func fourthSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1/3)))
        
        item.contentInsets = .init(top: 4, leading: 8, bottom: 4, trailing: 8)
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(0.9), heightDimension: .absolute(200)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets.leading = (self.view.frame.width - self.view.frame.width * 0.9) / 2
        
        section.contentInsets.trailing = (self.view.frame.width - self.view.frame.width * 0.9) / 2
            
        section.orthogonalScrollingBehavior = .groupPaging
        
        section.boundarySupplementaryItems = [header()]
        
        return section
    }
    
    func fifthSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0)))
        
        item.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(240)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets.leading = 11
        section.contentInsets.trailing = 11
        
        section.boundarySupplementaryItems = [header()]
        
        return section
    }
    
    func header() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
        
        return header
    }

}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        } else if section == 1 {
            return 8
        } else if section == 2 {
            return 3
        } else if section == 3 {
            return 9
        } else if section == 4 {
            return 10
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        cell.contentView.layer.cornerRadius = 15
        
        if indexPath.section == 0 {
            cell.contentView.backgroundColor = .green
        } else if indexPath.section == 1 {
            cell.contentView.backgroundColor = .blue
        } else if indexPath.section == 2 {
            cell.contentView.backgroundColor = .red
        } else if indexPath.section == 3 {
            cell.contentView.backgroundColor = .cyan
        } else if indexPath.section == 4 {
            cell.contentView.backgroundColor = .purple
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifier, for: indexPath) as! HeaderView
        
        if indexPath.section == 0 {
            header.headerLabel.text = "Section 1"
        } else if indexPath.section == 1 {
            header.headerLabel.text = "Section 2"
        } else if indexPath.section == 2 {
            header.headerLabel.text = "Section 3"
        } else if indexPath.section == 3 {
            header.headerLabel.text = "Section 4"
        } else if indexPath.section == 4 {
            header.headerLabel.text = "Section 5"
        }
        
        return header
    }
    
}

