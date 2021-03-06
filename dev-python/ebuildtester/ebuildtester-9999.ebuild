# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )

inherit git-r3 bash-completion-r1 distutils-r1

DESCRIPTION="A dockerized approach to test a Gentoo package within a clean stage3 container (fork)"
HOMEPAGE="https://github.com/andrex4k/ebuildtester"
EGIT_REPO_URI="https://github.com/andrex4k/ebuildtester"

LICENSE="BSD"
SLOT="0"

RDEPEND="
	app-emulation/docker
	sys-fs/fuse
"

BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/setuptools_scm[${PYTHON_USEDEP}]
	dev-python/sphinx[${PYTHON_USEDEP}]
"

src_install() {
	distutils-r1_src_install
	newbashcomp "${FILESDIR}/${PN}.bash-completion" "${PN}"
}
