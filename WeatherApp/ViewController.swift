//
//  ViewController.swift
//  WeatherApp
//
//  Created by DCS on 10/07/21.
//  Copyright © 2021 vishal. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
   
    private let welcome:UILabel = {
        let labl = UILabel()
        labl.text = "Welcome to WeatherApp"
        labl.font = UIFont(name: "Copperplate", size: 20.0)
        labl.textAlignment = .center
        labl.textColor = .black
        return labl
    }()

    
    private let myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "weather")
        return imageView
    }()
    
    
    private let login : UIButton = {
        let con = UIButton()
        
        con.setTitle("Go to Check Weather", for: .normal)
        con.addTarget(self, action: #selector(goto), for: .touchUpInside)
        con.setTitleColor(.white, for: .normal)
        con.layer.cornerRadius = 25
        con.backgroundColor = .black
        return con
        
        
    } ()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(welcome)
        view.addSubview(myImageView)
        view.addSubview(login)
        view.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        
        let bckimage = UIImageView(frame: UIScreen.main.bounds)
        bckimage.image = UIImage(named: "a2.jpg")
        bckimage.contentMode = UIView.ContentMode.scaleToFill
       self.view.insertSubview(bckimage, at: 0)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.view.backgroundColor = .white
        welcome.frame = CGRect(x: 30, y:view.safeAreaInsets.top + 40,width: view.width - 60, height: 40)
        myImageView.frame = CGRect(x: 140, y:view.safeAreaInsets.top + 240, width: 100, height: 100)
        login.frame = CGRect(x: 30, y: myImageView.bottom + 60, width: view.width - 60, height: 40)
    }
    
    
    @objc func goto()
    {
        let vc = HomeVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    
}
