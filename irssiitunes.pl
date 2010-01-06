use Irssi;
use Irssi::Irc;
use strict;
use vars qw($VERSION %IRSSI);

$VERSION = '1.00';
%IRSSI = (
    authors     => 'Angel Gonzalez',
    contact     => 'me@angelbroz.com',
    name        => 'Now Playing Itunes ',
    description => 'Allows to print the current ' .
                   'track in your irssi client ',
    license     => 'Public Domain'
);

command_bind nowp => sub {
    my($data, $server, $witem) = @_;
    $artista=`osascript -e 'tell application "iTunes" to artist of current track as string'`;
    $cancion=`osascript -e 'tell application "iTunes" to name of current track as string'`;
    $nowplaying = "NP: $artista - $cancio"";
    $witem->command("me $nowplaying");
};
