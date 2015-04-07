// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
println(str)

let messageLabel = UILabel(frame: CGRectMake(0, 0, 300, 50))
messageLabel.text = str

messageLabel

messageLabel.backgroundColor = UIColor.orangeColor()
messageLabel.textAlignment = NSTextAlignment.Center
messageLabel.layer.cornerRadius = 10.0
messageLabel.clipsToBounds = true
messageLabel

