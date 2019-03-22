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
	eapply_user

	# Update version info since we are using development version
	sed -i -e "s/^versjon='\(.*\)'$/versjon='\1 (SVN rev. $ESVN_WC_REVISION)'/" skript/ordbanken
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" DOC_PREFIX="${D}/usr/share/doc/${P}"  install
}
