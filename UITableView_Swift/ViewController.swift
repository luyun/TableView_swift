//
//  ViewController.swift
//  UITableView_Swift
//
//  Created by truekey on 17/2/8.
//  Copyright © 2017年 Luyun. All rights reserved.
//

import UIKit
//import LabelViewController

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    var myTableView:UITableView? = nil
    var titleLbl:UILabel? = nil
    
    var dataArray = NSMutableArray()
    let cellID = "testCellID"
    var isEdit = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        self.dataArray = ["LabelViewController","LabelLineSpaceViewController","ScrollView"]
        
        //添加UILabel
        self.titleLbl = UILabel.init(frame:CGRect(x:0, y:20, width:self.view.frame.size.width, height:20))
        self.titleLbl?.text = "选中"
        self.titleLbl?.textAlignment = .center
        self.titleLbl?.textColor = UIColor.red
        self.titleLbl?.font = UIFont.systemFont(ofSize: 15)
        self.view.addSubview(self.titleLbl!)
        
        
        //添加tableview
        self.myTableView = UITableView(frame:CGRect(x:0, y:40, width:self.view.frame.size.width, height:self.view.frame.size.height - 40), style:UITableViewStyle.plain)
        self.myTableView!.delegate = self
        self.myTableView!.dataSource = self
        self.view.addSubview(self.myTableView!)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell=tableView.dequeueReusableCell(withIdentifier: cellID)
        if(cell == nil){
            cell=UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: cellID);
        }
        cell?.textLabel?.text = "\(self.dataArray[indexPath.row])"
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerView:UIView? = nil
        headerView = UIView.init(frame: CGRect(x:0, y:0, width:self.view.frame.size.width, height:40))
        headerView?.backgroundColor = UIColor.blue
        
        let headerTitle = UILabel.init(frame: CGRect(x:0, y:0, width:self.view.frame.size.width, height:40))
        headerTitle.textColor = UIColor.red
        headerTitle.text = "header--\(section)"
        headerView?.addSubview(headerTitle)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        var footView:UIView? = nil
        footView = UIView.init(frame: CGRect(x:0, y:0, width:self.view.frame.size.width, height:40))
        footView?.backgroundColor = UIColor.brown
        
        let footerTitle = UILabel.init(frame: CGRect(x:0, y:0, width:self.view.frame.size.width, height:40))
        footerTitle.textColor = UIColor.red
        footerTitle.text = "footer--\(section)"
        footView?.addSubview(footerTitle)
        
        return footView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.titleLbl?.text = "\(self.dataArray[indexPath.row])"
//        if indexPath.row == 0 {
//            let labelVC = LabelLineSpaceViewController()
//            self.present(labelVC, animated: true) {
//                
//            }
//        }else if indexPath.section == 1{
//            let labelVC = LabelViewController()
//            labelVC.comeFrom = 1
//            self.navigationController?.pushViewController(labelVC, animated: true)
//        }

        switch indexPath.row {
        case 0:
            let labelVC = LabelViewController()
            labelVC.comeFrom = 1
            self.navigationController?.pushViewController(labelVC, animated: true)
            
        case 1:
            let labelVC = LabelLineSpaceViewController()
            self.present(labelVC, animated: true) {
                
            }
            
        case 2:
            let scrollViewVC = ScrollViewViewController()
            self.present(scrollViewVC, animated: true) {
                
            }

        default:
            break
        }
    }

}

