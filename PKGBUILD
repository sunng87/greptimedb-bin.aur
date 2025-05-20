# Maintainer: Ning Sun <n at sunng dot info>

pkgname=greptimedb-bin
pkgver=0.15.0.20250512
_pkgvergh=v0.15.0-nightly-20250512
pkgrel=2
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
sha256sums=('21a43c8e258501e45e87d765b6215f66823d90d4e770f45dcbe5975103c43822'
            '83e53f6273ce33dc86349d3f9a38bc8427d166c19d4468daf3eace924b3048a8'
            '9ac4c4b17f1ec7d6ade887cdf43fd5c9a7bf1e655c15331be91d2a1b9d199b55'
            'f11beeeab520997e7538ac8e1ac763f427db0766fdbeaff8c214dc153445b95b'
            '7e9d92e32fa973452667686cb3111a18be6bd4c6a9f0f0587fff9ba11d5d2e61')

package() {
    mkdir -p "${pkgdir}/etc/greptimedb/"
    install -Dm755 "${srcdir}/greptime-linux-amd64-${_pkgvergh}/greptime" "${pkgdir}/usr/bin/greptime"
    install -Dm644 "${srcdir}/greptimedb.service" "${pkgdir}/usr/lib/systemd/system/greptimedb.service"
    install -Dm644 "${srcdir}/greptimedb.sysusers" "${pkgdir}/usr/lib/sysusers.d/greptimedb.conf"
    install -Dm644 "${srcdir}/greptimedb-tmpfile.conf" "${pkgdir}/usr/lib/tmpfiles.d/greptimedb.conf"
    install -Dm644 "${srcdir}/greptimedb.toml" "${pkgdir}/etc/greptimedb/greptimedb.toml"
}
