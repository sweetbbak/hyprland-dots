# shellcheck disable=SC2034
typeset -U path PATH

# bins
path=(
  ~/.local/bin
  ~/bin
  ~/.cargo/bin
  ~/go/bin
  ~/dev/bin
  ~/ssd/vmshare/bin
  ~/.local/share/gem/ruby/3.0.0/bin/
  $path
)
# language bins
path=(~/.luarocks/bin ~/node_modules/.bin $path)
# script dirs
path=(~/scripts ~/scripts/fzf-bin ~/src ~/dev ~/dev/bin $path)
# appimages and apps
path=(~/apps ~/apps/blender340/blender.desktop $path) 

path+=(~/bin/**/*(N/))
# get dirs at 1 depth in bin
# dirs=$( fd . $HOME/bin/ -t d -d 1 )

# path=("$dirs")

# for dir in ~/bin ~/dev; do
# if [[ -z ${path[(r)$dir]} ]]; then
  # path=($dir $path)
# fi 
# done

# Define user directories
XDG_DATA_HOME="$HOME/.local/share"
XDG_CONFIG_HOME="$HOME/.config"
XDG_CACHE_HOME="$HOME/.cache"
XDG_STATE_HOME="$HOME/.local/state"

XDG_DESKTOP_DIR="$HOME/Desktop"
XDG_DOWNLOAD_DIR="$HOME/Downloads"
XDG_TEMPLATES_DIR="$HOME/Templates"
XDG_PUBLICSHARE_DIR="$HOME/Public"
XDG_DOCUMENTS_DIR="$HOME/Documents"
XDG_MUSIC_DIR="$HOME/Music"
XDG_PICTURES_DIR="$HOME/Pictures"
XDG_VIDEOS_DIR="$HOME/Videos"

export PATH

# env vars for image-upload-cli
# export CAPTION_FONT= # The default font is system dependent.
# export FREEIMAGE_KEY=
# export GYAZO_TOKEN=
# export IMAGEBAN_TOKEN=
# export IMGBB_KEY=
# export IMGCHEST_KEY=
# export IMGUR_CLIENT_ID=
# export LENSDUMP_KEY=
# export PTPIMG_KEY=
# export SMMS_KEY=
# export THUMBSNAP_KEY=
# export TIXTE_KEY=
# export UP2SHA_KEY=
# export UPLIO_KEY=
# export UPLOADCARE_KEY=
# export VGY_KEY=