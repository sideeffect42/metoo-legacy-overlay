# metoo-legacy-overlay

A [Gentoo](http://www.gentoo.org) overlay containing old ebuilds that
have been removed from the
[Gentoo repository](https://gitweb.gentoo.org/repo/gentoo.git).
Ebuilds are migrated to this overlay at the discretion of the
maintainer.

Ebuilds contained in this repository are outdated and likely to
contain **security vulnerabilities**.  USE AT YOUR OWN RISK!

## Installation

This overlay can be installed using
[eselect-repository](https://wiki.gentoo.org/wiki/Eselect/Repository):

```console
# eselect repository add metoo-legacy git https://github.com/sideeffect42/metoo-legacy-overlay.git
# emerge --sync metoo-legacy
```

Alternatively, this overlay can be installed using
[layman](https://wiki.gentoo.org/wiki/Layman):

```console
# layman -o https://github.com/sideeffect42/metoo-legacy-overlay/raw/master/repository.xml -f -a metoo-legacy
# layman-updater -R
```
