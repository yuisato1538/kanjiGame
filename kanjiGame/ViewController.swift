//
//  ViewController.swift
//  kanjiGame
//
//  Created by 佐藤優衣 on 2016/05/31.
//  Copyright © 2016年 Yui Sato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var btn1: UIButton!
    var btn2: UIButton!
    var btn3: UIButton!
    var btn4: UIButton!
    //    var hanteiLabel1: UILabel!
    // @IBOutlet weak var hanteiLabel: UILabel!
    @IBOutlet weak var hantei: UIImageView!
    @IBOutlet var timeLabel: UILabel!
    
    @IBOutlet var finishLabel: UILabel!
    
    var count: Int = 20
    var timer: NSTimer = NSTimer()
    var correctAnswer: Int = 0
    var total: Int = 0
    

    
    let damiArray = ["学", "岩", "国", "姉", "知", "長", "直", "店", "歩", "妹", "明", "夜", "育", "泳", "岸", "始", "使", "事", "者", "取", "受", "所", "注", "定", "波", "板", "表", "服", "物", "放", "味", "命", "油", "和", "芽", "官", "季", "泣", "協", "径", "刷", "参", "治", "周", "松", "卒", "底", "的", "毒", "念", "府", "法", "牧", "例", "易", "往", "価", "河", "居", "券", "効", "妻", "枝", "述", "承", "招", "制", "版", "肥", "非", "武", "沿", "延", "拡", "供", "呼", "刻", "若", "担", "忠", "届", "拝", "宝", "枚", "依", "押", "奇", "祈", "拠", "況", "屈", "肩", "刺", "沼", "征", "姓", "拓", "抵", "到", "突", "杯", "泊", "拍", "迫", "彼", "怖", "抱", "肪", "茂", "炎", "欧", "殴", "佳", "怪", "岳", "拘", "祉", "侍", "邪", "昇", "炊", "阻", "卓", "抽", "泌", "房", "免", "炉", "拐", "劾", "拒", "享", "弦", "肯", "昆", "肢", "叔", "枢", "斉", "析", "拙", "坪", "邸", "泥", "迭", "披", "附", "侮", "沸", "併", "泡", "奔", "抹", "岬", "盲", "枠", "宛", "旺", "苛", "玩", "股", "虎", "采", "刹", "呪", "狙", "妬", "阜", "枕", "弥", "拉", "科", "海", "活", "計", "後", "室", "首", "秋", "食", "星", "前", "点", "風", "屋", "界", "客", "急", "級", "係", "県", "研", "指", "持", "拾", "重", "昭", "乗", "神", "相", "送", "待", "炭", "柱", "追", "度", "畑", "発", "秒", "負", "洋", "紀", "型", "建", "律", "昨", "祝", "省", "信", "浅", "飛", "変", "便", "約", "勇", "要", "逆", "限", "故", "厚", "政", "祖", "則", "退", "独", "保", "迷", "映", "看", "巻", "紅", "砂", "姿", "城", "専", "染", "泉", "洗", "段", "派", "肺", "背", "威", "為", "皆", "狭", "枯", "荒", "香", "恒", "咲", "狩", "柔", "盾", "侵", "是", "俗", "耐", "珍", "怒", "逃", "峠", "柄", "盆", "郎", "哀", "卸", "架", "悔", "冠", "軌", "虐", "峡", "契", "弧", "孤", "郊", "恨", "削", "施", "牲", "促", "胎", "怠", "胆", "訂", "帝", "卑", "赴", "封", "胞", "幽", "厘", "姻", "疫", "垣", "括", "糾", "挟", "洪", "侯", "拷", "砕", "俊", "叙", "浄", "津", "甚", "帥", "窃", "荘", "衷", "挑", "勅", "亭", "貞", "洞", "柳", "畏", "茨", "咽", "怨", "柿", "柵", "拶", "拭", "栃", "虹", "眉", "訃", "昧", "侶", "思", "校", "家", "夏", "記", "帰", "原", "紙", "時", "弱", "書", "通", "馬", "院", "荷", "起", "庫", "根", "酒", "消", "息", "速", "庭", "島", "配", "倍", "病", "勉", "旅", "流", "挙", "訓", "郡", "候", "航", "差", "殺", "残", "借", "笑", "席", "倉", "孫", "帯", "徒", "特", "梅", "粉", "脈", "浴", "料", "連", "桜", "恩", "格", "個", "耕", "財", "師", "修", "素", "造", "能", "破", "俵", "留", "株", "降", "骨", "座", "蚕", "射", "従", "純", "除", "将", "針", "値", "展", "党", "討", "納", "俳", "班", "秘", "陛", "鬼", "恐", "恵", "軒", "剣", "剤", "脂", "称", "浸", "振", "陣", "扇", "恥", "致", "途", "透", "唐", "桃", "倒", "胴", "悩", "般", "被", "疲", "浜", "敏", "浮", "捕", "峰", "砲", "眠", "娘", "紋", "涙", "烈", "恋", "朗", "悦", "宴", "既", "脅", "倹", "悟", "娯", "疾", "殊", "徐", "辱", "粋", "衰", "隻", "桑", "託", "畜", "哲", "凍", "匿", "畔", "姫", "紛", "倣", "埋", "浪", "翁", "蚊", "核", "陥", "飢", "恭", "剛", "唆", "栽", "宰", "索", "桟", "酌", "珠", "准", "殉", "祥", "症", "娠", "唇", "畝", "逝", "栓", "租", "捜", "挿", "逐", "秩", "逓", "浦", "俸", "剖", "紡", "耗", "竜", "倫", "挨", "唄", "俺", "桁", "拳", "挫", "恣", "袖", "凄", "脊", "捉", "酎", "捗", "剥", "哺", "脇", "魚", "教", "強", "細", "週", "雪", "船", "組", "鳥", "野", "理", "悪", "球", "祭", "習", "終", "宿", "進", "深", "族", "第", "帳", "転", "都", "動", "部", "貨", "械", "救", "健", "康", "菜", "産", "唱", "清", "側", "停", "得", "敗", "副", "望", "陸", "移", "液", "眼", "規", "寄", "許", "経", "険", "現", "混", "採", "授", "術", "情", "設", "接", "断", "張", "貧", "婦", "務", "率", "略", "異", "域", "郷", "済", "視", "捨", "推", "盛", "窓", "探", "著", "頂", "脳", "閉", "訪", "密", "訳", "郵", "翌", "欲", "陰", "乾", "脚", "掘", "婚", "彩", "惨", "執", "斜", "釈", "寂", "紹", "脱", "淡", "添", "盗", "販", "描", "猛", "粒", "郭", "掛", "勘", "菊", "虚", "偶", "啓", "掲", "控", "紺", "赦", "酔", "惜", "措", "粗", "掃", "逮", "袋", "窒", "彫", "陳", "陶", "豚", "粘", "婆", "排", "陪", "符", "隆", "猟", "陵", "尉", "逸", "涯", "殻", "喝", "渇", "患", "偽", "菌", "蛍", "渓", "斎", "崎", "蛇", "渋", "粛", "淑", "庶", "渉", "訟", "剰", "紳", "据", "旋", "眺", "釣", "偵", "悼", "軟", "培", "舶", "猫", "瓶", "偏", "堀", "麻", "唯", "悠", "庸", "涼", "累", "萎", "崖", "亀", "惧", "舷", "梗", "頃", "痕", "埼", "斬", "鹿", "羞", "戚", "曽", "爽", "唾", "堆", "貪", "梨", "捻", "羽", "雙", "結"]
    
    let kanjiArray = ["亜", "杏", "一", "員", "英", "益", "円", "央", "王", "黄", "岡", "音", "果", "華", "且", "釜", "干", "甘", "貫", "間", "喜", "基", "貴", "宜", "吉", "京", "共", "興", "金", "栗", "圭", "景", "言", "工", "幸", "甲", "貢", "高", "三", "山", "士", "市", "爾", "実", "宗", "十", "春", "尚", "昌", "晶", "章", "常", "晋", "森", "申", "真", "臣", "人", "崇", "嵩", "宣", "閃", "善", "全", "奏", "早", "草", "其", "泰", "大", "只", "谷", "旦", "茶", "中", "宙", "呈", "典", "天", "田", "東", "同", "童", "寅", "奈", "内", "南", "二", "日", "埜", "八", "美", "苗", "夫", "富", "冨", "芙", "文", "平", "米", "豊", "本", "末", "未", "木", "門", "由", "容", "羊", "来", "蘭", "里", "立", "量", "林", "亘", "圓", "奎", "榮", "茉", "亞", "栞", "昊"]
    
    //線対称ボタンを表示する添字
    var collectnumber = Int(arc4random() % 4) + 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if !timer.valid {
            timer = NSTimer.scheduledTimerWithTimeInterval(1,
                                                           target: self,
                                                           selector: #selector(ViewController.up),
                                                           userInfo: nil,
                                                           repeats: true)
        }
        
        
        btn1 = view.viewWithTag(1) as! UIButton
        btn2 = view.viewWithTag(2) as! UIButton
        btn3 = view.viewWithTag(3) as! UIButton
        btn4 = view.viewWithTag(4) as! UIButton
        
        display()
        
    }
    
    func up() {
        count = count - 1
        timeLabel.text = String(format:"%d" , count)
        if count < 1 {
            timer.invalidate()
            finishLabel.text = "FINSH!!"
            finishLabel.textColor = UIColor.orangeColor()
            
            performSegueToResult()
            
        }
    }
    
    func performSegueToResult() {
        performSegueWithIdentifier("toResultView", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toResultView" {
            let resultviewController = segue.destinationViewController as! ResultViewController
            resultviewController.correctAnswer = self.correctAnswer
            resultviewController.total = self.total
        }
    }
    
    @IBAction func oneButton() {
        
        hantei.alpha = 1
        
        if collectnumber == 1 {
            hantei.image = UIImage(named: "maru.png")
            correctAnswer = correctAnswer + 1
        }else{
            hantei.image = UIImage(named: "batsu.png")
        }
        
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        
        
        let delay = 0.5 * Double(NSEC_PER_SEC)
        let time  = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            print("1秒後に実行される")
            self.hantei.alpha = 0
            self.collectnumber = Int(arc4random_uniform(UInt32(4))) + 1
            print(self.collectnumber)
            self.display()
            
            UIApplication.sharedApplication().endIgnoringInteractionEvents()
        })
        total = total + 1
    }
    
    @IBAction func twoButton() {
        
        hantei.alpha = 1
        
        if collectnumber == 2 {
            hantei.image = UIImage(named: "maru.png")
            correctAnswer = correctAnswer + 1
        }else{
            hantei.image = UIImage(named: "batsu.png")
        }
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        
        let delay = 0.5 * Double(NSEC_PER_SEC)
        let time  = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            print("1秒後に実行される")
            self.hantei.alpha = 0
            self.collectnumber = Int(arc4random_uniform(UInt32(4))) + 1
            print(self.collectnumber)
            self.display()
            
            UIApplication.sharedApplication().endIgnoringInteractionEvents()
        })
        total = total + 1
    }
    
    
    @IBAction func threeButton(){
        
        hantei.alpha = 1
        
        if collectnumber == 3 {
            hantei.image = UIImage(named: "maru.png")
            correctAnswer = correctAnswer + 1
        }else{
            hantei.image = UIImage(named: "batsu.png")
        }
        
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        
        let delay = 0.5 * Double(NSEC_PER_SEC)
        let time  = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            print("1秒後に実行される")
            self.hantei.alpha = 0
            self.collectnumber = Int(arc4random_uniform(UInt32(4))) + 1
            print(self.collectnumber)
            self.display()
            
            UIApplication.sharedApplication().endIgnoringInteractionEvents()
        })
        total = total + 1
    }
    
    @IBAction func fourButton() {
        
        hantei.alpha = 1
        
        if collectnumber == 4 {
            hantei.image = UIImage(named: "maru.png")
            correctAnswer = correctAnswer + 1
        }else{
            hantei.image = UIImage(named: "batsu.png")
        }
        
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        
        let delay = 0.5 * Double(NSEC_PER_SEC)
        let time  = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            print("1秒後に実行される")
            self.hantei.alpha = 0
            self.collectnumber = Int(arc4random_uniform(UInt32(4))) + 1
            print(self.collectnumber)
            self.display()
            
            UIApplication.sharedApplication().endIgnoringInteractionEvents()
        })
        total = total + 1
    }
    
    // 漢字４つを再表示
    func display() {
        let num1 = Int(arc4random_uniform(UInt32(damiArray.count)))
        btn1.setTitle(damiArray[num1], forState: .Normal)
        let num2 = Int(arc4random_uniform(UInt32(damiArray.count)))
        btn2.setTitle(damiArray[num2], forState: .Normal)
        let num3 = Int(arc4random_uniform(UInt32(damiArray.count)))
        btn3.setTitle(damiArray[num3], forState: .Normal)
        let num4 = Int(arc4random_uniform(UInt32(damiArray.count)))
        btn4.setTitle(damiArray[num4], forState: .Normal)
        
        let collecBtn = view.viewWithTag(collectnumber) as! UIButton
        let num = Int(arc4random_uniform(UInt32(kanjiArray.count)))
        collecBtn.setTitle(kanjiArray[num],forState:  .Normal)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

