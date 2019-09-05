//
//  BeneficiosEspecificosController.swift
//  Bencraft
//
//  Created by Martin Craviotto on 9/3/19.
//  Copyright © 2019 Martin Craviotto. All rights reserved.
//

import UIKit

class BeneficiosEspecificosController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var collectionView: UICollectionView?
    
    fileprivate var currentPage: Int = 0
    fileprivate var pageSize: CGSize {
        let layout = self.collectionView?.collectionViewLayout as! UPCarouselFlowLayout
        var pageSize = layout.itemSize
        pageSize.width += layout.minimumLineSpacing
        return pageSize
    }
    
    
    fileprivate var colors: [UIColor] = [UIColor.black, UIColor.red, UIColor.green, UIColor.yellow]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.addCollectionView()
        self.setupLayout()
    }
    
    func setupLayout() {
        let pointEstimator = RelativeLayoutUtilityClass(referenceFrameSize: self.view.frame.size)
        
        self.collectionView?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.collectionView?.topAnchor.constraint(equalTo: self.view.topAnchor, constant: pointEstimator.relativeHeight(multiplier: 0.1754)).isActive = true
        self.collectionView?.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        self.collectionView?.heightAnchor.constraint(equalToConstant: pointEstimator.relativeHeight(multiplier: 0.6887)).isActive = true
        
        self.currentPage = 0
    }
    
    func addCollectionView() {
        let pointEstimator = RelativeLayoutUtilityClass(referenceFrameSize: self.view.frame.size)
        
        let layout = UPCarouselFlowLayout()
        layout.itemSize = CGSize(width: pointEstimator.relativeWidth(multiplier: 0.73333), height: 400)
        layout.scrollDirection = .horizontal
        
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.collectionView?.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        
        let spacingLayout = self.collectionView?.collectionViewLayout as! UPCarouselFlowLayout
        spacingLayout.spacingMode = UPCarouselFlowLayoutSpacingMode.overlap(visibleOffset: 20)
        
        self.collectionView?.backgroundColor = UIColor.gray
        self.view.addSubview(self.collectionView!)
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! CardCell
        
        cell.customView.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    // MARK: - UIScrollViewDelegate
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let layout = self.collectionView?.collectionViewLayout as! UPCarouselFlowLayout
        let pageSide = (layout.scrollDirection == .horizontal) ? self.pageSize.width : self.pageSize.height
        let offset = (layout.scrollDirection == .horizontal) ? scrollView.contentOffset.x : scrollView.contentOffset.y
        currentPage = Int(floor((offset - pageSide / 2) / pageSide) + 1)
    }
    
    // So the compiler doesn't complain
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class CardCell: UICollectionViewCell {
    let customView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.customView)
        
        self.customView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.customView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.customView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        self.customView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1).isActive = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class RelativeLayoutUtilityClass {
    
    var heightFrame: CGFloat?
    var widthFrame: CGFloat?
    
    init(referenceFrameSize: CGSize){
        heightFrame = referenceFrameSize.height
        widthFrame = referenceFrameSize.width
    }
    
    func relativeHeight(multiplier: CGFloat) -> CGFloat{
        
        return multiplier * self.heightFrame!
    }
    
    func relativeWidth(multiplier: CGFloat) -> CGFloat{
        return multiplier * self.widthFrame!
        
    }
}

