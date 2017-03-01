//
//  LabelViewController.swift
//  UITableView_Swift
//
//  Created by truekey on 17/2/9.
//  Copyright © 2017年 Luyun. All rights reserved.
//

import UIKit

class LabelViewController: UIViewController {

    var comeFrom = Int()
    var myLabel:UILabel? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        self.initBackButton()
        self.initLabel()
        // Do any additional setup after loading the view.
    }
    
    
    /// 添加backBtn
    func initBackButton() {
        let backBtn = UIButton.init(frame: CGRect(x:20, y:20, width:100, height:50))
        backBtn.backgroundColor = UIColor.blue
        backBtn.setTitle("Back", for: .normal)
        backBtn.setTitleColor(UIColor.brown, for: .normal)
        backBtn.addTarget(self, action: #selector(backBtnClick), for: .touchUpInside)
        self.view.addSubview(backBtn)
    }
    
    func initLabel() {
        self.myLabel = UILabel.init(frame: CGRect(x:20, y:80, width:self.view.frame.size.width - 40, height:50))
        self.myLabel?.text = "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
        
        /// 计算label的高度，不带间距的
        let attributes = [NSFontAttributeName: self.myLabel?.font]//计算label的字体
        let labelSize = self.labelSize(text: (self.myLabel?.text)!, labelWidth:self.view.frame.size.width - 40 ,attributes: attributes as [String : AnyObject])
        self.myLabel?.frame = CGRect(x:20, y:80, width:self.view.frame.size.width - 40, height:labelSize.height)
        self.myLabel?.numberOfLines = 0
        self.myLabel?.backgroundColor = UIColor.yellow
        self.view.addSubview(self.myLabel!)
    }
    
    
    
    /// UILabel自适应高度
    ///
    /// - Parameters:
    ///   - text: label显示文字
    ///   - labelWidth: label最大宽度
    ///   - attributes: 字体，间距等
    /// - Returns: 返回计算的高度
    func labelSize(text:String ,labelWidth:CGFloat ,attributes : [String : AnyObject]) -> CGRect{
        var size = CGRect();
        let size2 = CGSize(width: labelWidth, height: 0);//设置label的最大宽度
        size = text.boundingRect(with: size2, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes , context: nil);
        return size
    }
    
    
    func labelSizeWithLineSpacing(_ text:String,lineSpace:CGFloat) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string:text)
        let paragraphStye = NSMutableParagraphStyle()
        
        paragraphStye.lineSpacing = lineSpace
        let rang = NSMakeRange(0, CFStringGetLength(text as CFString!))
        attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStye, range: rang)
        return attributedString
    }
    
    
    /// backBtn点击事件
    func backBtnClick() {
        switch comeFrom {
        case 0:
            self.dismiss(animated: true, completion: {
                
            })
        case 1:
            _ = self.navigationController?.popViewController(animated: true)
        default:
            break
        }
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
