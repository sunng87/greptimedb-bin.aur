# Maintainer: Ning Sun <n at sunng dot info>

pkgname=greptimedb-bin
pkgver=0.1.0.20221123
_pkgvergh=v0.1.0-alpha-20221123-nightly
pkgrel=1
pkgdesc='Open-source time-series database.'
arch=('x86_64')
url='https://github.com/GreptimeTeam/greptimedb'
license=('Apache-2.0')
provides=('greptimedb')
conflicts=()

source=("https://github.com/GreptimeTeam/greptimedb/releases/download/${_pkgvergh}/greptime-linux-amd64.tgz")
sha256sums=("cc43e96d354f57961c181b7d8118d901dc033836f401acd39675aa9436eb7063")

package() {
    install -Dm755 "${srcdir}/greptime" "${pkgdir}/usr/bin/greptime"
}
