<br>
<div align="center"><img src="auth.svg" width="200" height="120"/></div>
<div align="center"><span><h3>Snapper</h3></span></div>
<div align="center"><b>简单好用的权限管理系统，专注权限，让权限更简单，让数据更安全</b></div>
<hr/>
<h2>概要</h2>
<p>不依赖于业务，方便集成，开箱即用，简单几步配置即可集成到系统，注解式配置 + 运行时增强 + 界面化配置多种方式，用户 + 用户组 + 职位多种维度，授权码 + 时间段 + 委托 多种模式解决授权难题
<p>本项目已将权限功能封装为单独的系统，拥有独立界面，与业务系统隔离，通过界面配置即可实时实现资源权限、业务数据权限、功能数据权限、列数据权限的功能</p>
<p>工作流<a href="https://flow.baomibing.com" target="_blank">snapper-flow</a>，让工作流更简单，敬请期待（即将到来），当前部署仅前端项目</p>
<hr/>
<h2>核心功能(V3.2.0)：</h2>
<ul>
    <li>用户管理 管理系统用户，激活、启用、停用、重置密码、设置标签等功能</li>
    <li>角色管理 管理系统的资源权限，分配用户，资源授权等功能</li>
    <li>用户组  管理多个用户为一组，集中进行角色分配及数据权限分配</li>
    <li>组织架构 管理系统组织架构，分配人员，职位，角色等功能</li>
    <li>职位管理 管理组织中的职位，分配职位对应的角色和数据权限等功能</li>
    <li>授权管理 从用户和用户组维度，对功能进行功能数据权限、业务数据权限、列数据权限的分配</li>
    <li>菜单管理 管理系统中的菜单资源和按钮资源，对每个功能进行业务动作关联</li>
    <li>数据列 管理业务表中数据列，业务数据权限分配时按照指定列分配</li>
    <li>字典管理 管理系统中字典数据，比如用户业务标记，用来与数据权限关联</li>
    <li>参数管理 管理系统中的关键参数，比如网站LOGO等</li>
    <li>业务日志 管理系统中的日志，包含操作人、操作模块、请求信息、异常信息、浏览器信息等</li>
    <li>接入用户 管理第三方接入系统的用户，设置IP段、生效时间段、分配APPID、APPKEY等</li>
    <li>接入日志 管理第三方接入系统的日志，包含请求IP、来源系统、浏览器、请求信息、错误信息等</li>
    <li>限流管理 配置某些规则进行系统流量限制</li>
    <li>租户管理 管理系统中的租户，租户与租户之间进行数据隔离，每个租户可以配置自己的用户、角色、权限等信息</li>
    <li>租户菜单 管理租户允许使用的菜单及按钮</li>
    <li>租户日志 查看租户操作的业务日志</li>
    <li>租户接口 对租户开通相关接口，可用于计费等信息</li>
</ul>
<hr/>
<h2>前端启动：</h2>
修改config/proxy.js

```javascript
dev: {
    '/authority/': {
      target: 'http://127.0.0.1:8090/',
      changeOrigin: true,
      pathRewrite: {
         'authority': 'api'
      }
    }
  }
```

<h2>启动项目</h2>
<ol>
<li>初始化数据库：创建MySQL数据库snapper,导入snapper-3.2.0.sql</li>
<li>打开src/main/envs/env-dev.properties配置数据库信息及Redis信息（基于内存的正在优化），密码可以通过test下的EncryptUtil进行加密</li>
<li>打开项目目录下com.baomibing.SnamServerBootstrap.java文件，执行main方法即可(右键debug...)</li>
</ol>

<h2>使用方式(文档建设中)：</h2>
只需要在service实现类中配置以下两个注解，剩下的交给Snapper

```java
@Action(value = "ORDER_SEARCH")
@ActionConnect(value = {"selectList","selectCount"})
```

<ul>
 <li>@Action - 关联权限定义，当前按钮中关联的权限定义</li>
 <li>@ActionConnect - 关联mapper名称，当前Service方法中调用的需要过滤权限的mapper方法</li>
</ul>
<hr/>
<h2>该项包含的子项目</h2> 
<ul>
    <li><a href="https://gitee.com/ifrog/snam-standalone">snam-standalone，单机版项目，基于Spring-boot，是权限功能的后台服务端，为集成权限的后台示例</a></li>
    <li><a href="https://gitee.com/ifrog/snam">snam 基于React、Antd，是权限功能的UI端，开箱即用(NEWUI分支)</a></li>
</ul>
<h2>相关链接</h2>
<ul>
    <li><a href="https://baomibing.com">官网</a></li>
    <li><a href="https://baomibing.com/pages/the-quick-start/">项目使用介绍</a></li>
    <li><a href="https://admin.baomibing.com/user/login">权限配置环境演示</a></li>
</ul>
<hr/>
<h2>演示账号</h2>

<ul>
    <li>ximen/123456 - 管理员账号（组织属于青岛分公司）- 能看到所有数据</li>
    <li>用户列表中的其他账号（除frog），密码均为123456，方便进行权限数据的查看</li>
    <li>锁定数据不允许修改，仅供参考，若需进一步验证可通过管理员账号进行数据创建</li>
</ul>

<b>注意：管理员账号分属不同分公司，创建的数据所属组织为对应的组织！</b>
<hr/>
<h2>界面部分截图</h2>

![changelog.png](images/changelog.png)
![user.png](images/user.png)
![uset.png](images/uset.png)
![group.png](images/group.png)
![resource.png](images/resource.png)
![dict.png](images/dict.png)
![menu.png](images/menu.png)
![column.png](images/column.png)
![tenant.png](images/tenant.png)
