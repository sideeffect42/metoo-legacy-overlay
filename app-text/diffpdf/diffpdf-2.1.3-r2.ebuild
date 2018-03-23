# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit qt4-r2 desktop eutils qmake-utils

DESCRIPTION="Program that textually or visually compares two PDF files"
HOMEPAGE="https://www.qtrac.eu/diffpdf.html"
SRC_URI="http://www.qtrac.eu/${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~arm ~x86"
SLOT="0"
IUSE="qt5"

RDEPEND="
	!qt5? (
		app-text/poppler[qt4]
		>=dev-qt/qtcore-4.6:4
		>=dev-qt/qtgui-4.6:4
	)
	qt5? (
		app-text/poppler[qt5]
		dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtprintsupport:5
		dev-qt/qtwidgets:5
	)
"
DEPEND="${RDEPEND}
	qt5? ( dev-qt/linguist-tools:5 )
"

DOCS="README"

src_prepare() {
	if use qt5; then
		# Patch the code just enough so that it builds with Qt5
		epatch "${FILESDIR}/${P}-qt5.patch"
	fi
}

src_configure() {
	if use qt5; then
		local qt_bindir=$(qt5_get_bindir)
	else
		local qt_bindir=$(qt4_get_bindir)
	fi



	${qt_bindir}/lrelease diffpdf.pro || die "Generating translations failed"

	if use qt5; then
		eqmake5 PREFIX="${EPREFIX}/usr" diffpdf.pro
	else
		qt4-r2_src_configure
	fi
}

src_install() {
	use qt5 || qt4-r2_src_install

	einstalldocs
	dobin diffpdf
	doman diffpdf.1
	domenu "${FILESDIR}/${PN}.desktop"
	newicon images/icon.png "${PN}.png"
}
