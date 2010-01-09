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

sub nowp {
    my ($data, $server, $witem) = @_;
    my $artista = `osascript -e 'tell application "iTunes" to artist of current track as string'`;
    my $cancion = `osascript -e 'tell application "iTunes" to name of current track as string'`;
    my $nowplaying = "NP: $artista - $cancion";
    $witem->command("me $nowplaying");
};

Irssi::command_bind('np', 'nowp');
