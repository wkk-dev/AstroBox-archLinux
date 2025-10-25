# 发版步骤

---

## GitHub仓库部分
### 1.在GitHub仓库Release版本
保证title为`v`+`版本号`，文件名为`AstroBox_v版本号_amd64.deb`。
上传后复制文件hash。
### 2.修改`PKGBUILD`
如果同一版本的多次aur仓库发布，需要加入3)
#### 1)修改版本号
```PKGBUILD
pkgver=1.5.3
```
不包含v
#### 2)修改hash值
```PKGBUILD
sha256sums=('刚才复制的hash')
```
#### 3)可选步骤.如果同一版本号多个aur包
```PKGBUILD
pkgrel=1
```
`pkgrel`的值需要加一，每个版本的第一个aur包默认为1。
### 3.更新`.SCRINFO`
```bash
makepkg --printsrcinfo > .SRCINFO
```
### 4.测试是否可用。
```bash
sudo pacman -Rs astro-box #卸载之前的
makepkg -si #在当前仓库构建
```
### 5.查看软件的详情页版本号

---

## AUR仓库部分
### 1.克隆仓库。
```bash
git clone ssh://aur@aur.archlinux.org/astro-box.git
```
### 2.替换刚才GitHub仓库的内容。
替换`PKGBUILD`和`.SRCINFO`
### 3.git添加文件
```bash
git add PKGBUILD .SRCINFO
```
### 4.git commit信息
AUR不允许空提交
```bash
git commit -m "commit信息"
```
### 5.push
```bash
git push
```
