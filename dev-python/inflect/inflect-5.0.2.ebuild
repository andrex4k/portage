# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )=( pypy3 python3_{7..9} )

inherit distutils-r1

DESCRIPTION="Correctly inflect words and numbers"
HOMEPAGE="https://github.com/jaraco/inflect"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ppc ppc64 ~riscv s390 sparc x86 ~x64-macos"

BDEPEND="
	>=dev-python/setuptools_scm-3.4.1[${PYTHON_USEDEP}]
	dev-python/toml[${PYTHON_USEDEP}]
"

distutils_enable_sphinx docs '>=dev-python/jaraco-packaging-3.2' \
	'>=dev-python/rst-linker-1.9' dev-python/alabaster
distutils_enable_tests pytest

python_test() {
	# Override pytest options to skip flake8
	pytest -vv tests --override-ini="addopts=--doctest-modules" \
		|| die "tests failed with ${EPYTHON}"
}