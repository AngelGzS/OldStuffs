#!/bin/bash
# Angel Gonzalez me@angelbroz.com
#
# Script para actualizar tu estado en twitter, 
# con lo que estas esucchando en iTunes
#
# Testeado en Mac OSX Snow Leopard

#configuracion de twitter
user="usuario";
pass="password"; 

status=`osascript -e 'tell application "iTunes" to player state as string'`;
if [ $status != "playing" ]; then
    echo "iTunes no esta reproduciendo nada ._.";
    exit;
fi

artista=`osascript -e 'tell application "iTunes" to artist of current track as string'`;
cancion=`osascript -e 'tell application "iTunes" to name of current track as string'`;
album=`osascript -e 'tell application "iTunes" to album of current track as string'`;
 
np="NowPlaying:";

if [ "$artista" != "" ]; then
   np="$np $artista -";
fi

np="$np $cancion";

if [ "$album" != "" ]; then
   np="$np ($album)";
fi

cu="`curl -s -u \"$user:$pass\" --data-urlencode \"status=$np\"  \"http://twitter.com/statuses/update.xml\"`";
res=`echo $cu | egrep -o "<error>.*</error>" | sed 's/<error>//g' | sed 's/<\/error>//g'`;
if [ "$res" != "" ]; then
   echo "Nope, hay un error: \"$res\"";
   exit;
fi
echo "Correcto estado actualizado a: $np";


