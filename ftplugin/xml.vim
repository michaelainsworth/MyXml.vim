if exists('b:did_ftplugin') && 1 == b:did_ftplugin
    finish
endif

" Note that this is meant to be used with an XML plugin.

" Type ee/ to end a self-closing element
imap ee/ Bi<Ea />hh                                                       

" Type eel to end an inline element.
imap eel Bi<Ea>

" Type een to end an element and space it out.
imap een Bi<Ea>> jj

