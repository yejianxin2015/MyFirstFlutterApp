### 概念

我们的开发主要以`git fork`为主,fork工作流可以让我们在不影响主项目的前提下,自由改动代码.

相关概念:

-   本地仓库(local )
-   远程个人仓库(origin )[fork from upstream]
-   上游仓库(upstream)

我们在进行日常代码pull和push的时候,是对origin的修改和同步,如果开发完成后,想将自己的改动同步到upstream分支,需要创建pull merge request



### `GIT` 开发流程

1.  fork [MyFirstFlutterApp](https://github.com/yejianxin2015/MyFirstFlutterApp)项目

    ![](https://s3.bmp.ovh/imgs/2022/07/06/a629ac31b3eebb89.png)

2.  `git clone` 项目到本地

    如果采用 ssh方式，可参考下文 [SSH配置](#SSH配置)

3.  `git checkout` 个人分支

4.  进行本地开发

5.  `git push` 到 远程个人仓库

6.  创建 pull merge request ，从 origin 到 upstream

![](https://s3.bmp.ovh/imgs/2022/07/06/2f7aa8ccd8fa99ce.png)



### SSH配置

1.  检查是否已SSH KEY, 如果已存在，可直接添加到 github

    ```
    cd ~/.ssh   #windows的路径一般在C:\Users\Administrator.ssh下
    ls
    ```

    ![](https://s3.bmp.ovh/imgs/2022/07/06/8bceb3ef43ed94c8.png)

2.  如果不存在，创建 ssh key

    ```
    ssh-keygen -t rsa -b 4096 -C "你的 github 邮箱"
    ```

    然后根据提示进行操作，第一步输入文件名，第二步输入密码，第三步确认密码。

3.  操作完成后，复制 is_rsa.pub 的内容

    ```
    cat id_rsa.pub
    ```

4.  添加SSH Key到github

![](https://s3.bmp.ovh/imgs/2022/07/06/559c2a76ae832685.png)

![](https://s3.bmp.ovh/imgs/2022/07/06/41ae719c46db8acd.jpg)

title可随意填写，key 填写刚才复制的 id_rsa.pub的内容



