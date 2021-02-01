# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_SETUPTOOLS=rdepend
PYTHON_COMPAT=( python3_{7..9} )=( python3_{7,8} pypy3 )

inherit distutils-r1

DESCRIPTION="A plugin to make nose behave better"
HOMEPAGE="https://pythonhosted.org/nose_fixes/ https://pypi.org/project/nose_fixes/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="
	dev-python/nose[${PYTHON_USEDEP}]"
DEPEND="
	${RDEPEND}
	doc? (
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/pkginfo[${PYTHON_USEDEP}]
	)"

distutils_enable_sphinx docs \
	dev-python/pkginfo
distutils_enable_tests nose