# Makefile for AstroBox AUR package
# Maintainer: WaiJade , wkk-dev

.PHONY: build install update clean test check checksums help

# 构建并安装包
build:
	makepkg -si

# 仅构建包（不安装）
package:
	makepkg

# 安装已构建的包
install:
	sudo pacman -U astrobox-*.pkg.tar.zst

# 更新到最新版本（运行你的更新脚本）
update:
	./update_version.sh

# 测试构建（不安装）
test:
	@echo "Testing build..."
	makepkg -c
	@echo "Build test completed."

# 检查包规范
check:
	@echo "Checking PKGBUILD..."
	namcap PKGBUILD
	@echo "Updating .SRCINFO..."
	makepkg --printsrcinfo > .SRCINFO
	@echo ".SRCINFO updated."

# 生成校验和
checksums:
	@echo "Updating checksums..."
	updpkgsums
	@echo "Checksums updated."

# 清理构建文件
clean:
	@echo "Cleaning build files..."
	rm -rf src/ pkg/ *.pkg.tar.zst *.tar.xz *.tar.gz *.deb
	@echo "Cleaned."

# 重新生成所有元数据
refresh: checksums check
	@echo "All metadata refreshed."

# 显示帮助信息
help:
	@echo "Available targets:"
	@echo "  build      - Build and install package"
	@echo "  package    - Build package only"
	@echo "  install    - Install built package"
	@echo "  update     - Update to latest version"
	@echo "  test       - Test build without installing"
	@echo "  check      - Check PKGBUILD and update .SRCINFO"
	@echo "  checksums  - Update checksums in PKGBUILD"
	@echo "  clean      - Clean build files"
	@echo "  refresh    - Update checksums and .SRCINFO"
	@echo "  help       - Show this help"

# 默认目标
.DEFAULT_GOAL := help
