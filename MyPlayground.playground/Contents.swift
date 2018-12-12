import UIKit



//var str = "Hello, playground"
//
//print(str)
//
////var a = md5("123456")
////print(a)
//
////let btn = UIButton(type: .system)
//
//let btn = UIButton(frame:CGRect(x:0,y:0,width:200,height:200))
//
//
//btn.setTitle("按钮", for: .normal)
//
//
//btn.setTitle("按钮23", for: .normal)
//
////btn.backgroundColor = UIColor("red")
//
//
////class Person {
////    let name: String
////    init(name: String) {
////        self.name = name
////        print("\(name) 开始初始化")
////    }
////    deinit {
////        print("\(name) 被析构")
////    }
////}
////
////// 值会被自动初始化为nil，目前还不会引用到Person类的实例
////var reference1: Person?
////var reference2: Person?
////var reference3: Person?
////
////// 创建Person类的新实例
////reference1 = Person(name: "Runoob")
////
////
//////赋值给其他两个变量，该实例又会多出两个强引用
////reference2 = reference1
////reference3 = reference1
////
//////断开第一个强引用
////reference1 = nil
//////断开第二个强引用
////reference2 = nil
//////断开第三个强引用，并调用析构函数
////reference3 = nil
//
//
//class Person {
//    let name: String
//    init(name: String) { self.name = name }
//    var apartment: Apartment?
//    deinit { print("\(name) 被析构") }
//}
//
//class Apartment {
//    let number: Int
//    init(number: Int) { self.number = number }
//    var tenant: Person?
//    deinit { print("Apartment #\(number) 被析构") }
//}
//
//// 两个变量都被初始化为nil
//var runoob: Person?
//var number73: Apartment?
//
//// 赋值
//runoob = Person(name: "Runoob")
//number73 = Apartment(number: 73)
//
//// 意感叹号是用来展开和访问可选变量 runoob 和 number73 中的实例
//// 循环强引用被创建
//runoob!.apartment = number73
//number73!.tenant = runoob
//
//// 断开 runoob 和 number73 变量所持有的强引用时，引用计数并不会降为 0，实例也不会被 ARC 销毁
//// 注意，当你把这两个变量设为nil时，没有任何一个析构函数被调用。
//// 强引用循环阻止了Person和Apartment类实例的销毁，并在你的应用程序中造成了内存泄漏
//runoob = nil
//number73 = nil
//
//
//class Module {
//    let name: String
//    init(name: String) { self.name = name }
//    var sub: SubModule?
//    deinit { print("\(name) 主模块") }
//}
//
//class SubModule {
//    let number: Int
//
//    init(number: Int) { self.number = number }
//
//    weak var topic: Module?
//
//    deinit { print("子模块 topic 数为 \(number)") }
//}
//
//var toc: Module?
//var list: SubModule?
//toc = Module(name: "ARC")
//list = SubModule(number: 4)
//toc!.sub = list
//list!.topic = toc
//
//toc = nil
//list = nil
//
//
////swift 反射
//
////用户类
//class User {
//    var name:String = ""  //姓名
//    var nickname:String?  //昵称
//    var age:Int?   //年龄
//    var emails:[String]?  //邮件地址
//}
//
//
////创建一个User实例对象
//let user1 = User()
//user1.name = "hangge"
//user1.age = 100
//user1.emails = ["hangge@hangge.com","system@hangge.com"]
//
////将user对象进行反射
//let hMirror = Mirror(reflecting: user1)
//
//print("对象类型：\(hMirror.subjectType)")
//print("对象子元素个数：\(hMirror.children.count)")
//
//print("--- 对象子元素的属性名和属性值分别如下 ---")
//for case let (label?, value) in hMirror.children {
//    print("属性：\(label)     值：\(value)")
//}
//
//print("hi2")

extension String
{
    func checkPhoneNo() -> Bool {
        if let _ = self.range(of: "^1[3|4|5|7|8][0-9]{9}$", options: .regularExpression) {
            return true
        }
        return false
        
    }
}



//var rs : Bool = "232625919523".checkPhoneNo()

var rs : Bool = "132".checkPhoneNo()

print(rs)

print("hi")

var bbb:String = "ee"

print(bbb)

let  constStr:String = "33"

print(constStr)


func getIncFunc(inc: Int) -> (Int) -> Int
{
    var max = 10
    func incFunc(x :Int) ->Int{
        print("incFunc函数结束")
        //        return inc + x
        max = max + 1
        return max + x
    }
    // 当执行到这一句时inc参数就应该被释放了, 但是由于在内部函数中使用到了它, 所以它被捕获了
    // 同理, 当执行完这一句时max变量就被释放了,但是由于在内部函数中使用到了它, 所以它被捕获了
    print("getIncFunc函数结束")
    return incFunc
}

// 被捕获的值会和与之对应的方法绑定在一起, 同一个方法中的变量会被绑定到不同的方法中
let incFunc = getIncFunc(inc:5)
print(incFunc(5))
print(incFunc(5))
let incFunc2 = getIncFunc(inc:5)
print(incFunc2(5))

print(incFunc(5))


struct Pet {    var name: String
    init(name: String) {        self.name = name
    }
    
    func printNameClosure() -> () -> Void {        return {            print(self.name)
        }
    }
}

var pet: Pet = Pet(name: "旺旺")
//let cl = pet.printNameClosure()
//pet.name = "强强"
//cl() //2


let cl = {
    print(pet.name)
}


cl()

pet.name = "强强"

cl()


// 闭包环境变量

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)

print(incrementByTen())
// returns a value of 10
print(incrementByTen())
// returns a value of 20
print(incrementByTen())
// returns a value of 30

let incrementBySeven = makeIncrementer(forIncrement: 7)

print(incrementBySeven())
// returns a value of 7


print(incrementByTen())
// returns a value of 40

print(incrementBySeven())
// returns a value of 7



