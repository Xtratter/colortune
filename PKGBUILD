# Maintainer: Xtratter
pkgname=colortune
pkgver=1.0.0
pkgrel=1
pkgdesc='Gamma and saturation sliders for KDE Plasma Wayland via generated ICC profiles'
arch=('any')
url='https://github.com/Xtratter/colortune'
license=('MIT')
depends=('python' 'python-pyqt5' 'libkscreen')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
