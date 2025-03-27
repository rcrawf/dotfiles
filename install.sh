#!/bin/bash

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +'PlugInstall --sync' +qa

cp .vimrc ~/.vimrc

cat <<EOF > ~/.vim/coc-settings.json
{
	"languageserver": {
		"terraform": {
			"command": "terraform-ls",
			"args": ["serve"],
			"filetypes": [
				"terraform",
				"tf"
			],
			"initializationOptions": {},
			"settings": {}
		}
	}
  "go.goplsOptions": {
    "staticcheck": true
  },
  "go.lintTool": "golangci-lint",
  "go.lintFlags": ["--enable=unused,govet"],
  "go.formatTool": "goimports",
  "go.usePlaceholders": true,
  "go.autoBuild": "on",
  "go.diagnosticsDelay": "500ms",
  "go.inlayHint.enable": true
}

EOF

# Global linters

pip3 install pylint ruff mymy pyright
# go install honnef.co/go/tools/cmd/staticcheck@latest
