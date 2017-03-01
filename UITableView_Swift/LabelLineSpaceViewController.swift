//
//  LabelLineSpaceViewController.swift
//  UITableView_Swift
//
//  Created by truekey on 17/2/10.
//  Copyright © 2017年 Luyun. All rights reserved.
//

import UIKit

class LabelLineSpaceViewController: BaseViewController {
    var myLabel:UILabel? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.initLabel()
        // Do any additional setup after loading the view.
    }
    
    func initLabel() {
        self.myLabel = UILabel.init(frame: CGRect(x:20, y:80, width:self.view.frame.size.width - 40, height:50))
        let content = "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
        self.myLabel?.numberOfLines = 0
        self.myLabel?.backgroundColor = UIColor.yellow
        self.myLabel?.attributedText = self.labelSizeWithLineSpacing(content, lineSpace: 8)
        let labelSize = self.getLableLineSpace(text: content, lblFont: (self.myLabel?.font)!,lineSpace: 8)
        self.myLabel?.frame = CGRect(x:20, y:80, width:labelSize.width, height:labelSize.height)
        self.view.addSubview(self.myLabel!)
    }
    
    
    /// 给label添加行间距
    ///
    /// - Parameters:
    ///   - text: 内容
    ///   - lineSpace: 行间距
    /// - Returns: attributedText
    func labelSizeWithLineSpacing(_ text:String,lineSpace:CGFloat) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string:text)
        let paragraphStye = NSMutableParagraphStyle()
        
        paragraphStye.lineSpacing = lineSpace
        let rang = NSMakeRange(0, CFStringGetLength(text as CFString!))
        attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStye, range: rang)
        return attributedString
    }
    
    /// 计算有间距的label的真实高度
    ///
    /// - Parameters:
    ///   - text: label显示内容
    ///   - lblFont: 字体
    ///   - lineSpace: 间距
    /// - Returns: 返回宽高
    func getLableLineSpace(text:String,lblFont:UIFont,lineSpace:CGFloat) -> CGSize {
        var size = CGSize()
        
        let attributes = NSDictionary(object: lblFont, forKey: NSFontAttributeName as NSCopying)
        let oneRowSize = text.size(attributes: attributes as? [String : Any])
        let labelAttribute = [NSFontAttributeName: self.myLabel?.font]//计算label的字体
        let textSize = self.labelSize(text: text, labelWidth: (self.myLabel?.frame.size.width)!, attributes: labelAttribute as [String : AnyObject])
        let lineNum = textSize.height/oneRowSize.height
        
        var realHeight = oneRowSize.height
        if realHeight > 1 {
            realHeight = (lineNum * oneRowSize.height) + lineNum * lineSpace
        }
        size = CGSize(width:textSize.width,height:realHeight)
        return size
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
