#  change-accent

*Requires macOS 10.14 or later.*

change-accent is a command line utility written in Swift to change the macOS Mojave accent colour. It will change the system global defaults to use the new colour in the same way System Preferences does, and will also send the relevant system notifications so that all apps will update their accents and highlight colours accordingly. Pairs well with [pywal](https://github.com/dylanaraps/pywal).

## Install

###### Homebrew

```
brew tap epetousis/repo
brew install change-accent
```

###### Manually

```
git clone https://github.com/epetousis/change-accent
cd change-accent
xcodebuild
cp build/Release/change-accent /usr/local/bin/change-accent
```

## Usage

`$ change-accent [OPTIONS]`

### Options
`--accent <COLOUR>`
Set the macOS system accent colour.

Accepted colours for this option are:
- purple
- pink
- red
- orange
- yellow
- green
- graphite
- blue
- #[hex]

You can also parse a hexadecimal colour beginning with a #. change-accent will attempt to use a simplistic [Euclidean](https://en.wikipedia.org/wiki/Color_difference#Euclidean) algorithm to attempt to find the accent colour with the shortest colour space distance to your desired colour, as macOS unfortunately appears to hardcode these accents in.

## License

GPLv3 © Evangelos Petousis
