EAPI="6"

inherit subversion
ESVN_REPO_URI="svn://svn.savannah.nongnu.org/ordbanken/trunk"

DESCRIPTION="An easy-to-use program for looking up and filtering entries in the full form lexicons for Norwegian Nynorsk and Norwegian Bokmål"
HOMEPAGE="https://savannah.nongnu.org/projects/ordbanken/"
LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~x86 ~amd64"

RDEPEND="sys-apps/grep
	sys-apps/sed
	sys-apps/gawk
	sys-apps/util-linux
	"

DEPEND="${RDEPEND}"

src_prepare() {
	# Avoid that "make install" installs docs in (wrong) location
	sed -i -e '/DOC_FILES=/d' Makefile
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install
	dodoc COPYING gpl-3.0.txt LESMEG norsk_ordbank.pdf NYTT README
}
