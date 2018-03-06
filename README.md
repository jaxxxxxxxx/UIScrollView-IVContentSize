# UIScrollView-IVContentSize

## 需求
  最近在开发中遇到了，tableView的tableViewHeader超过一定高度时，PromptView显示不完全的情况，如下图：
  ![1](https://github.com/jaxxxxxxxx/UIScrollView-IVContentSize/blob/master/Image/1.gif)  
  基于这个需求，所以写了UIScrollView+IVContentSize。
## 使用
  快速使用
  ``` Objective-C
  //导入
  #import "UIScrollView+IVContentSize.h"

  //加入代码
  self.tableView.iv_autoContentSize = YES;
  ```

  默认了两个值，可按自己的需求修改。
  ``` Objective-C
  //提示页的tag
  #define PromptView_Tag 10000

  //提示页到底部的距离
  #define PromptView_Bottom 100
  ```
  使用
  ``` Objective-C
  //导入
  #import "UIScrollView+IVContentSize.h"

  //加入代码
  self.tableView.iv_autoContentSize = YES;
  ```
  设置某个scrollView promptViewTag
  ``` Objective-C
  self.iv_promptViewTag = 9999;
  ```
   
  对scrollView设置 bottomPadding 
  设置某个scrollView bottomPadding 
  ``` Objective-C
  self.iv_bottomPadding = 200;
  ```

## overview:
  ![2](https://github.com/jaxxxxxxxx/UIScrollView-IVContentSize/blob/master/Image/2.gif) 
