//
//  ScheduleView.swift
//  StreamingApp
//
//  Created by FGX on 2022/08/01.
//

import UIKit

class ScheduleView: UICollectionViewController {
    var presenter: ViewToPresenterScheduleProtocol?
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
        
        Timer.scheduledTimer(withTimeInterval: 30, repeats: true) { [self] timer in
            presenter?.viewDidLoad()
        }
    }
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return eventData.count
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

extension ScheduleView : UICollectionViewDelegateFlowLayout{
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

extension ScheduleView: PresenterToViewScheduleProtocol {
    func updateView(eventData: [EventData]) {
        DispatchQueue.main.async {
            UIView.setAnimationsEnabled(false)
            print("repeat")
            self.eventData = eventData
            self.collectionView.reloadData()
            UIView.setAnimationsEnabled(true)
        }
      
    }
    
}
    

