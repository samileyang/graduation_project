# 毕业设计
毕业设计 for Dr.Xiaodong Zhu via Python&Django&Mysql  

## 开发环境  
| 语言 | 版本 |
| ---------- | -----------|
| Python  |3.7.2 | 
| Django | 2.1.0 |
| Mysql | 5.7 |

## 启动方式  
_for windows_   
找到`manage.py`根目录  
输入`cmd`  
随后输入 `python manage.py runserver`  
__注意__ 修改`settings.py`中的数据库属性  

## 涉及的Python包  
1. `datetime`  
2. `django.db.models`中的`Sum`、`Count`、`Avg`、`F`  
3. `matplotlib`  
4. `numpy`  
5. `django`  
建议使用Anaconda的内置Python   

## 系统组成  
1. 教务系统  
2. 图书馆管理系统  
3. 二手商品交易系统  
4. 个人申请系统  
5. 信用评级子系统  

## 学生个人界面-评分和排名  
![](/img/1.PNG)  
## 学生个人界面-雷达图  
![](/img/2.PNG)  
## 人才招募评分  
![](/img/3.PNG)  
## 贷款发放评分  
![](/img/4.PNG)  

*注意* 出于便利，所有外键都已经删除，导致数据库大量陈余，对于 `orm` 比较了解的话建议把外键都加上，可以实现更多的操作。  

### Finished on May 10th,2019

