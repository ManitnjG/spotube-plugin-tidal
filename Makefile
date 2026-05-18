# Makefile for spotube-plugin-tidal
# Requires: hetu_script_dev_tools (dart pub global activate hetu_script_dev_tools)

PLUGIN_NAME = spotube-plugin-tidal
ENTRY       = src/main.ht
OUTPUT      = $(PLUGIN_NAME).smplug

.PHONY: all build clean install

all: build

build:
	@echo "Compiling Hetu Script plugin..."
	hetuc compile $(ENTRY) -o $(OUTPUT)
	@echo "✅ Built: $(OUTPUT)"

clean:
	@rm -f $(OUTPUT)
	@echo "Cleaned build artifacts."

install: build
	@echo "Plugin ready to install in Spotube: $(OUTPUT)"
	@echo "Use the Upload button in Spotube Settings → Metadata Provider Plugins"
