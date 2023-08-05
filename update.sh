set -e

##export tag=${{steps.fetch-latest-release.tag_name}}
export ver=$(echo $tag | cut -d - -f 1)
export tagdate=$(echo $tag | cut -d - -f 3)
export pkgver=${ver#v}.$tagdate

sed -i -r s/^pkgver=.+/pkgver=$pkgver/ PKGBUILD

if [[ -n $(git status --porcelain) ]]; then
    ## pkgver changed
    export sha256sum=$(curl -L https://github.com/GreptimeTeam/greptimedb/releases/download/${tag}/greptime-linux-amd64-${tag}.sha256sum)

    sed -i -r s/^pkgrel=.+/pkgrel=1/ PKGBUILD
    sed -i -r s/^_pkgvergh=.+/_pkgvergh=$tag/ PKGBUILD
    sed -i -r s/^sha256sums=.+/sha256sums=\(\"$sha256sum\"/ PKGBUILD

    sed -i -r s/pkgver.+/pkgver\ =\ $pkgver/ .SRCINFO
    sed -i -r s/pkgrel.+/pkgrel\ =\ 1/ .SRCINFO
    sed -i -r s/download\\/.+\\//download\\/$tag\\// .SRCINFO
    sed -i -r s/greptime-linux-amd64-.+\\.tar\\.gz/greptime-linux-amd64-$tag.tar.gz/ .SRCINFO
    sed -i -r 0,/sha256sums.+/s//sha256sums\ =\ $sha256sum/ .SRCINFO

    echo "dirty=yes" >>$GITHUB_OUTPUT
fi
