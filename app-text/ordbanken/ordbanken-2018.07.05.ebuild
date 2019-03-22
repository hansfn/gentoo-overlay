EAPI="6"

inherit eutils

MY_PV="${PV//./-}"
SRC_URI="http://download.savannah.nongnu.org/releases/ordbanken/ordbanken-${MY_PV}.tar.xz -> ${P}.tar.xz"
S="${WORKDIR}/${PN}"
DESCRIPTION="An easy-to-use program for looking up and filtering entries in the full form lexicons for Norwegian Nynorsk and Norwegian Bokmål"
HOMEPAGE="https://savannah.nongnu.org/projects/ordbanken/"
LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="x86 amd64"

RDEPEND="sys-apps/grep
	sys-apps/sed
	sys-apps/gawk
	sys-apps/util-linux
	"

DEPEND="${RDEPEND}"

src_prepare() {
	eapply "${FILESDIR}/bash_completion.patch"

	eapply_user
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" DOC_PREFIX="${D}/usr/share/doc/${P}"  install
}
