//
//  ViewController.swift
//  test_swift
//
//  Created by 加藤 隆義 on 2014/10/05.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //var collectionView: UICollectionView?
    
    var arr:[String] = []
    
    var name : AnyObject?{
        get {
            return NSUserDefaults.standardUserDefaults().objectForKey("name")
        }
        set{
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "name")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //arr = ["photo1.jpg","photo2.jpg","photo3.jpg","photo4.jpg","photo5.jpg","photo6.jpg","photo7.jpg","photo8.jpg","photo9.jpg"]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //表示するアイテムの数を指定する
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return arr.count
        return 21
    }
    
    //セルに描画する
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as myCollectionViewCell

        //cell.imgView.image = UIImage(named: arr[indexPath.row])
        cell.imgView.image = UIImage(named: "photo" + String(indexPath.row + 1) + ".jpg")
        return cell
    }
    
    //セルが押されたときの処理
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath!) {
        
        //name = arr[indexPath.row]
        name = "photo" + String(indexPath.row + 1) + ".jpg"
    }
    
    

    
    
    
}

