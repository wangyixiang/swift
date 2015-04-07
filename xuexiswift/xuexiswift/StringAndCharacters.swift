//
//  StringAndCharacters.swift
//  xuexiswift
//
//  Created by yixiang.wang on 4/6/15.
//  Copyright (c) 2015 wangyixiang. All rights reserved.
//

import Foundation

func runInStringAndCharacters(){
    stringLiterals()
    familarWithString()
}

func stringLiterals(){
    println("除了普通的字符串输入，在literals里还支持下面4种表达方法")
    println("转义字符，这个在C语言中也是存在的，如\', \"")
    println("单字节Unicode标量，如 \\u{24} 表示 \u{24} ")
    println("双字节Unicode标量，如 \\u{2665} 表示 \u{2665}")
    println("四字节Unicode标量，如 \\u{0001F496} 表示 \u{0001F496}")
}

func familarWithString(){
    println("var emptyString=\"\" 是和 var anotherEmptyString ＝ String()是等价的")
    var emptyString = ""
    var anotherEmptyString = String()
    if emptyString.isEmpty && anotherEmptyString.isEmpty {
        println("利用String的isEmpty属性来判断，结果就是")
        println("see, they are empty.")
    }
    
    println("在ObjectC中字符串和可变字符串是由NSString和NSMutableString分别代表的。")
    println("在Swift中使用String一个类型就可以了，因为有let和var两种声明方式，系统就可以判断了")
    
    println("***有一点要强调的是String在function和method之间传递时，默认行为时copy-by-value的而不是reference***")
    println("这是因为Swift中String时Value Type，而不是引用Type")
    
    println("String中存储的是Character的集合，而Charatcer中储存的是Unicode的raw数据，在Swift的官方文档中，称为encoding-independent Unicode characters")
    println("在Swift中，Uicode是使用Unicode Scala来保持的，也就是说Character里面其实存储的是一个或多个Unicode Scala")
    println("下面举手册里的相关例子，可以体会一下")
    println("体会这句话：表示同一个Character，其可以有多种的Unicode Scala的组成形式")
    
    let eAcute: Character = "\u{E9}"                         // é
    let combinedEAcute: Character = "\u{65}\u{301}"          // e followed by ́
    
    println("println(\"\\(eAcute)   \\(combinedEAcute)\")")
    println("\(eAcute)   \(combinedEAcute)")
    
    // 韩文的例子
    let precomposed: Character = "\u{D55C}"                  // 한
    let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ
    
    println("println(\"\\(precomposed)   \\(decomposed)\")")
    println("\(precomposed)   \(decomposed)")
    
    println("可以看到输出的是同样的字符，其实Swift手册中是有着关于Character的严格定义的，并引入了Extended Grapheme Clusters的概念")
    println("每个Character实例都表示＊一个＊EGC，而每个EGC由一个或多个Unicode Scalar组成并由其产生一个人类可阅读字符")
    println("所以前面由不同unicode scalar组成的EGC最终产生了相同的Character")
    
    println("这就引出了下面两个经典问题，字符比较，字符串的比较问题和长度问题")
    println("看下面这个例子")
    
    var word = "cafe"
    var word1 = word
    var word2 = "caf\u{E9}"
    println("the number of characters in \(word) is \(countElements(word)) and utf16Count is \(word.utf16Count)")
    // prints "the number of characters in cafe is 4"
    
    word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301
    
    println("the number of characters in \(word) is \(countElements(word)) and utf16Count is \(word.utf16Count)")
    // prints "the number of characters in café is 4"
    
    if word != word1 {
        println("word is not equal to word1")
    }

    if word == word2 {
        
        println("word is equal to word2")
    }
}