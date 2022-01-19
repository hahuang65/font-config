#!/bin/sh

if [ $(uname) = "Darwin" ]; then  
  fonts_dir="${HOME}/Library/Fonts"
elif [ $(uname) = "Linux" ]; then
  fonts_dir="${HOME}/.local/share/fonts"
else
  echo "OS not supported."
  exit 1
fi

mkdir -p "${fonts_dir}"

for font in **/*.ttf
do
  cp "${font}" "${fonts_dir}"
done

if [ $(uname) = "Linux" ]; then  
  mkdir -p "${HOME}/.config/fontconfig"
  ln -s "${PWD}/noto-emoji.conf" "${HOME}/.config/fontconfig/"
  fc-cache --verbose
fi
