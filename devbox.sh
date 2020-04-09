#!/usr/bin/env bash
##
 # Copyright © 2015 by David Alger. All rights reserved
 # 
 # Licensed under the Open Software License 3.0 (OSL-3.0)
 # See included LICENSE file for full text of OSL-3.0
 # 
 # http://davidalger.com/contact/
 ##

set -e

function setup_devbox {
    made_changes=
    echo "==> Checking dependencies"

    install_environment
    
    assert_pack aescrypt
    assert_pack autoconf
    assert_pack automake
    assert_pack figlet
    assert_pack git-flow
    assert_pack glib
    assert_pack grunt-completion
    assert_pack less
    assert_pack zlib
        
    assert_pack hub
    assert_pack md5sha1sum
    assert_pack nmap
    assert_pack node
    assert_pack openssl
    assert_pack pcre
    assert_pack python
    assert_pack readline
    assert_pack rename
    assert_pack siege
    assert_pack sloccount
    assert_pack sqlite
    assert_pack wakeonlan
    assert_pack watch

    assert_cask java
    assert_cask dropbox
    assert_cask firefox
    assert_cask imageoptim
    assert_cask livereload
    assert_cask phpstorm
    assert_cask sequel-pro

    # inform user and exit
    if [ $made_changes ]; then
        echo "Process Complete!"
    else
        echo "Nothing to do!"
    fi
}

if ! type -t install_environment && [[ -f $(dirname $0)/install.sh ]]; then
    source $(dirname $0)/install.sh
fi

if type -t install_environment; then
    setup_devbox
else
    echo "usage: curl -s https://raw.githubusercontent.com/classyllama/devenv/master/vagrant/bin/install.sh" \
        " https://raw.githubusercontent.com/classyllama/devenv/master/vagrant/bin/devbox.sh | bash /dev/stdin --lib-mode"
fi
