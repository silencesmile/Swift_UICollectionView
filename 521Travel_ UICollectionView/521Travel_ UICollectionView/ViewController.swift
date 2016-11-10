//
//  ViewController.swift
//  521Travel_ UICollectionView
//
//  Created by youngstar on 16/11/4.
//  Copyright © 2016年 521Travel.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {

    let courses = [
        ["name":"Swift","pic":"aaa"],
        ["name":"OC","pic":"bbb"],
        ["name":"java","pic":"ccc"],
        ["name":"php","pic":"ddd"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let layout = UICollectionViewFlowLayout()
        
        // 必须要初始化 添加Layout
        let collection = UICollectionView.init(frame: CGRect(x:0, y:20, width:375, height:657), collectionViewLayout: layout)
        //设置每一个cell的宽高
        layout.itemSize = CGSize(width:100, height:100)
        collection.delegate = self
        collection.dataSource = self
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collection.backgroundColor = UIColor.white
        
        
        self.view .addSubview(collection)
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return courses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identify = "cell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identify, for: indexPath) as UICollectionViewCell
        
        let imageView = UIImageView()
        imageView.frame = CGRect(x:5, y:5, width:70, height:70)
        imageView.image = UIImage(named:courses[indexPath.row]["pic"]!)
        
        let  label = UILabel.init(frame:  CGRect(x:5, y:70, width:70, height:30))
        label.text = courses[indexPath.row]["name"]
        label.textAlignment = NSTextAlignment(rawValue: 1)!
        
        cell.contentView .addSubview(label)
        cell.contentView .addSubview(imageView)
        cell.backgroundColor = UIColor.lightGray
        
        return cell
    }
    
    //返回cell 上左下右的间距
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
        return UIEdgeInsetsMake(5, 10, 5, 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("您点击了第\(indexPath.row)个")
    }
    

}

