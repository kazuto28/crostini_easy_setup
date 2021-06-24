#!/bin/bash

function abort
{
echo -e "\e[1;31m$@\e[0m" 1>&2
exit 1
}

function info
{
echo -e "\e[1;32m$@\e[0m"
}

function install_ydlg {
    rm -rf /tmp/install_ydlg
    mkdir -p /tmp/install_ydlg
    info "ファイルをダウンロードしています..."
    curl -L# "https://raw.githubusercontent.com/kazuto28/youtube-dl-gui/master/packages/youtube-dlg_0.4-1~w2d0_all.deb" -o /tmp/install_ydlg/youtube-dlg.deb || abort "ダウンロードが中断されました"
    curl -L# "http://ftp.jaist.ac.jp/debian/pool/main/p/python-pypubsub/python3-pubsub_4.0.3-4_all.deb" -o /tmp/install_ydlg/python3-pubsub.deb || abort "ダウンロードが中断されました"

    info "インストールしています..."
    sudo apt install /tmp/install_ydlg/python3-pubsub.deb /tmp/youtube-dlg.deb

    sudo rm -rf /tmp/install_ydlg

    info "インストールが完了しました"
}

function uninstall_ydlg {
    
}

case $@ in
	install)	install_ydlg
		;;
	uninstall)	uninstall_ydlg
		;;
	help)	usage
		;;
	\?)	install
		;;
esac