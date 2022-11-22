set -e

##export tag=${{steps.fetch-latest-release.tag_name}}
export tagdate=$(echo $tag | cut -d - -f 3)
export sha256sum=$(curl -L https://github.com/GreptimeTeam/greptimedb/releases/download/$tag/greptime-linux-amd64.sha256sum)
export pkgver=0.1.0.$tagdate
export source="https://github.com/GreptimeTeam/greptimedb/releases/download/${tag}/greptime-linux-amd64.tgz"

sed -i -r s/^pkgver=.+/pkgver=$pkgver/ PKGBUILD
sed -i -r s/^_pkgvergh=.+/_pkgvergh=$tag/ PKGBUILD
sed -i -r s/^sha256sums=.+/sha256sums=\(\"$sha256sum\"\)/ PKGBUILD

sed -i -r s/pkgver.+/pkgver\ =\ $pkgver/ .SRCINFO
sed -i -r s/download\\/.+\\//download\\/$tag\\// .SRCINFO
sed -i -r s/sha256sums.+/sha256sums\ =\ $sha256sum/ .SRCINFO

git diff --no-ext-diff --quiet --exit-code
