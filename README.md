# DCURLRouter
自定义URL实现控制器之间的跳转

---
使用方法:

只要把`DCURLRouter`这个文件夹拖到项目中就行了,后续会支持`cocoapods`.

---
#### 1.配置
1. 创建DCURLRouter.一个plist文件,文件夹中有,只要修改下就行了,大概的对应关系如下图所示
![](http://upload-images.jianshu.io/upload_images/924285-3a4ba764f9860049.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
2. 加载DCURLRouter.plist文件数据

 ```Objective-C 
    [DCURLRouter loadConfigDictFromPlist:@"DCURLRouter.plist"];
 ```

#### 2. push和modal的使用
所有的push和modal方法都可以通过DCURLRouter这个类方法来调用.这样在push和modal的时候就不需要拿到导航控制器或控制器再跳转了.也就是说,以后push和modal控制器跳转就不一定要在控制器中进行了.

1.push控制器

```Objective-C 
    // 不需要拼接参数直接跳转
    [DCURLRouter pushURLString:@"dariel://twoitem" animated:YES];
    
    // 直接把参数拼接在自定义url末尾
    NSString *urlStr = @"dariel://twoitem?name=dariel&userid=213213";
    [DCURLRouter pushURLString:urlStr animated:YES];
    // 可以将参数放入一个字典
    NSDictionary *dict = @{@"userName":@"Hello", @"userid":@"32342"};
    [DCURLRouter pushURLString:@"dariel://twoitem" query:dict animated:YES];

    // 如果当前控制器和要push的控制器是同一个,可以将replace设置为Yes,进行替换.
    [DCURLRouter pushURLString:@"dariel://oneitem" query:dict animated:YES replace:YES];
    
    // 重写了系统的push方法,直接通过控制器跳转
    TwoViewController *two = [[TwoViewController alloc] init];
    [DCURLRouter pushViewController:two animated:YES];
```
2.modal控制器
用法和push差不多,只是这里添加了一个给modal出来的控制器加一个导航控制器的方法.


 ```Objective-C
    // 不需要拼接参数直接跳转
    [DCURLRouter presentURLString:@"dariel://threeitem" animated:YES completion:nil];
    
    // 直接把参数拼接在自定义url末尾
    NSString *urlStr = @"dariel://threeitem?name=dariel&userid=213213";
    [DCURLRouter presentURLString:urlStr animated:YES completion:nil];

    // 可以将参数放入一个字典
    NSDictionary *dict = @{@"userName":@"Hello", @"userid":@"32342"};
    [DCURLRouter presentURLString:@"dariel://threeitem" query:dict animated:YES completion:nil];

    // 给modal出来的控制器添加一个导航控制器
    [DCURLRouter presentURLString:@"dariel://threeitem" animated:YES withNavigationClass:[UINavigationController class] completion:nil];

    // 重写了系统的modal方法
    ThreeViewController *three = [[ThreeViewController alloc] init];
    [DCURLRouter presentViewController:three animated:YES completion:nil];
 ```

#### 3. 后退 pop 和 dismiss
在实际开发中,好几次的界面的跳转组成了一个业务流程,整个业务流程结束后通常会要求返回最开始的界面,这就要让控制器连续后退好几次,但苹果是没有提供方法的.DCURLRouter给出了具体的实现方案.

pop:

 ```Objective-C
    /** pop掉一层控制器 */
    + (void)popViewControllerAnimated:(BOOL)animated;
    /** pop掉两层控制器 */
    + (void)popTwiceViewControllerAnimated:(BOOL)animated;
    /** pop掉times层控制器 */
    + (void)popViewControllerWithTimes:(NSUInteger)times animated:(BOOL)animated;
    /** pop到根层控制器 */
    + (void)popToRootViewControllerAnimated:(BOOL)animated;
 ```
dismiss:

```Objective-C
    /** dismiss掉1层控制器 */
    + (void)dismissViewControllerAnimated: (BOOL)flag completion: (void (^ __nullable)(void))completion;
    /** dismiss掉2层控制器 */
    + (void)dismissTwiceViewControllerAnimated: (BOOL)flag completion: (void (^ __nullable)(void))completion;
    /** dismiss掉times层控制器 */
    + (void)dismissViewControllerWithTimes:(NSUInteger)times animated: (BOOL)flag completion: (void (^ __nullable)(void))completion;
    /** dismiss到根层控制器 */
    + (void)dismissToRootViewControllerAnimated: (BOOL)flag completion: (void (^ __nullable)(void))completion;
```
#### 4.参数的接收,以及其它方法
在3中如果在自定义了URL后面拼接了参数,或者用字典传递了参数,那么在目的控制器怎么接收呢?其实参数的接收很简单.只要导入这个分类`#import "UIViewController+DCURLRouter.h"`就行了,然后就能拿到这三个参数.

```Objective-C
    NSLog(@"接收的参数%@", self.params);
    NSLog(@"拿到URL:%@", self.originUrl);
    NSLog(@"URL路径:%@", self.path);
```
但有时我们我需要把值传递给发送push或者modal方的控制器,也就是逆传,也很简单,可以用代理或者block.有方法可以拿到当前的控制器,以及导航控制器

```Objective-C
    // 拿到当前控制器
    UIViewController *currentController = [DCURLRouter sharedDCURLRouter].currentViewController;
    // 拿到当前控制器的导航控制器
    UINavigationController *currentNavgationController = [DCURLRouter sharedDCURLRouter].currentNavigationViewController;

```
#### 5.具体的实现原理
[简书](http://www.jianshu.com/p/36a43202b0cd)
