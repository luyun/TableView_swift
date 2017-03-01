//
//  BaseViewController.swift
//  UITableView_Swift
//
//  Created by truekey on 17/2/10.
//  Copyright © 2017年 Luyun. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.initBackButton()
        // Do any additional setup after loading the view.
    }
    
    /// 添加backBtn
    func initBackButton() {
        let backBtn = UIButton.init(frame: CGRect(x:0, y:20, width:50, height:25))
        backBtn.backgroundColor = UIColor.blue
        backBtn.setTitle("Back", for: .normal)
        backBtn.setTitleColor(UIColor.brown, for: .normal)
        backBtn.addTarget(self, action: #selector(backBtnClick), for: .touchUpInside)
        self.view.addSubview(backBtn)
    }
    
    /// backBtn点击事件
    func backBtnClick() {
        self.dismiss(animated: true, completion: {
            
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
