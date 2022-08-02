//
//  EventView.swift
//  StreamingApp
//
//  Created by FGX on 2022/08/01.
//

import UIKit

class EventView: UICollectionViewController {
    var presenter: ViewToPresenterEventProtocol?
    var eventData:[EventData] = [EventData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        
        guard let collectionView = collectionView,
        let layout = collectionViewLayout as? UICollectionViewFlowLayout else {
                   return
        }
        collectionView.backgroundColor = .white
        // Register cell classes
        collectionView.register(EventCell.self, forCellWithReuseIdentifier: EventCell.reuseIdentifier)
        
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    }
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return eventData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = eventData[indexPath.row]
        presenter?.open(videoUrl:data.videoUrl!)
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCell.reuseIdentifier, for: indexPath) as? EventCell {
            let data = eventData[indexPath.row]
            cell.title.text = data.title
            cell.subTitle.text = data.subtitle
            cell.image.loadFromUrl(data.imageUrl)
            cell.date.text = DateFormat.formatDate(date: data.date)
                .format
        
            return cell
        }
        return UICollectionViewCell()
    }
}

extension EventView: PresenterToViewEventProtocol {
    func updateView(eventData: [EventData]) {
        DispatchQueue.main.async {
            self.eventData = eventData
            self.collectionView.reloadData()
        }
      
    }
    
}
extension EventView : UICollectionViewDelegateFlowLayout{
      func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
      ) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = collectionView.bounds.size.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: 80)
      }
      func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
      ) -> UIEdgeInsets {
        return sectionInsets
      }
      func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
      ) -> CGFloat {
        return sectionInsets.left
      }
}

