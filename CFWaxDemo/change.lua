-- require "SimpleMapController"//  引入其他 lua 文件
-- 类的声明，添加代理
waxClass{"ViewController", UIViewController, protocols = {"UITableViewDelegate"}}

-- 已有方法重写
--[[ 多行注释--]]
function touchesBegan_withEvent(self, touches, event)
    self:setTitle("first")
    print(self:getIvarInteger("_aInteger"))
    print("fix a bug")
    self:view():setBackgroundColor(UIColor:blueColor())
end

function reloadUI(self)
    self:btn():setTitle_forState("push to", UIControlStateNormal)
    self:view():setBackgroundColor(UIColor:greenColor())
end

function update(self, sender)
    
    -- local: 申明局部变量 不加为全局变量
    local vc = MyViewController:init()
    self:navigationController():pushViewController_animated(vc, true)
end

-- Second
waxClass{"MyViewController", UIViewController}

function viewDidLoad(self)
   
    self:view():setBackgroundColor(UIColor:redColor())
    self:setTitle("Second")
    
    --  全局变量声明
    self.userName = "chengf_0224@163.com"
    self.passWord = "224420"
    -- 结构体
    self.location = {
        lat=37.7749295,
        long=-122.4194155,
    }
    print(self.location.lat)

    -- 创建一个 view 使用 Masonry Block
    myView = UIView:init()
    self:view():addSubview(myView)
    myView:setBackgroundColor(UIColor:blackColor())
    
    --[[ block 写法
     [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(200);
        make.left.equalTo(self.view).offset(50);
        make.width.offset(10);
        make.height.offset(10);
     }];
     --]]
    myView:masUNDERxLINEmakeConstraints(
        toblock(
        function(make)
            make:top():equalTo()(self:view()):offset()(64)
            make:left():equalTo()(self:view()):offset()(10)
            make:width():offset()(100)
            make:height():offset()(100)
        end
        ,{"void", "MASConstraintMaker *"}
                )
        )
end


function touchesBegan_withEvent(self, touches, event)
    self.location.lat = self.location.lat + 5
    print(self.location.lat)
    print(self.userName)
    print(myView)
    
    -- for 循环 + if 循环
    for i = 0, 10, 1
        do
        print(i)
        if (i == 5)
            then
            print("i == 5")
        end
    end

end

waxClass{"TestBtn", UIButton}

function init(self)
    self.super:init()
    a = 10
    b = "chengfei"
    self:setTitle_forState("test button", UIControlStateNormal)
    self:setBackgroundColor(UIColor:orangeColor())
    
    return self
end


