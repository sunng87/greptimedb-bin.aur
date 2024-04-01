# Maintainer: Ning Sun <n at sunng dot info>

pkgname=greptimedb-bin
pkgver=0.8.0.20240401
_pkgvergh=v0.8.0-nightly-20240401
pkgrel=1
pkgdesc='Open-source time-series database.'
arch=('x86_64')
url='https://github.com/GreptimeTeam/greptimedb'
license=('Apache-2.0')
provides=('greptimedb')
conflicts=()

source=("https://github.com/GreptimeTeam/greptimedb/releases/download/${_pkgvergh}/greptime-linux-amd64-${_pkgvergh}.tar.gz"
    "greptimedb.sysusers"
    "greptimedb.service"
    "greptimedb-tmpfile.conf"
    "greptimedb.toml")
sha256sums=("518add5b33edc5a5c3029095624a3a7447efa6b38029659e99ad85be6911eaa5"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP")

package() {
    mkdir -p "${pkgdir}/etc/greptimedb/"
    install -Dm755 "${srcdir}/greptime-linux-amd64-${_pkgvergh}/greptime" "${pkgdir}/usr/bin/greptime"
    install -Dm644 "${srcdir}/greptimedb.service" "${pkgdir}/usr/lib/systemd/system/greptimedb.service"
    install -Dm644 "${srcdir}/greptimedb.sysusers" "${pkgdir}/usr/lib/sysusers.d/greptimedb.conf"
    install -Dm644 "${srcdir}/greptimedb-tmpfile.conf" "${pkgdir}/usr/lib/tmpfiles.d/greptimedb.conf"
    install -Dm644 "${srcdir}/greptimedb.toml" "${pkgdir}/etc/greptimedb/greptimedb.toml"
}
