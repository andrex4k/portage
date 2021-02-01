# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python3_{7..9} )=( python3_{7,8} pypy3 )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1

DESCRIPTION="A repository of test results"
HOMEPAGE="https://launchpad.net/testscenarios"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 ~hppa ~ia64 ~m68k ~mips ppc ppc64 s390 sparc x86 ~amd64-linux ~x86-linux"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/subunit-0.0.18[${PYTHON_USEDEP}]
	>=dev-python/testtools-0.9.30[${PYTHON_USEDEP}]
	dev-python/fixtures[${PYTHON_USEDEP}]"
#bzr is listed but presumably req'd for a live repo test run

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( ${RDEPEND}
		dev-python/testresources[${PYTHON_USEDEP}]
		dev-python/testscenarios[${PYTHON_USEDEP}]
		dev-python/pytz[${PYTHON_USEDEP}]
	)"

# Required for test phase
DISTUTILS_IN_SOURCE_BUILD=1

PATCHES=(
	"${FILESDIR}"/${P}-test-backport.patch
	"${FILESDIR}"/${P}-test-backport1.patch
	"${FILESDIR}"/${P}-test-backport2.patch
)

python_test() {
	# some errors appear to have crept in the suite undert py3 since addition.
	# Python2.7 now passes all.

	${PYTHON} testr init || die
	${PYTHON} testr run || die
}