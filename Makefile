GIT_HASH=`git rev-parse HEAD`
GIT_TAG=`git tag --points-at HEAD`
OUTPUT=build
BINARY_LINUX=custom-command
BINARY_WIN=custom-command.exe
BINARY_MAC=custom-command-mac
BUILD_FLAGS=-ldflags="-s -w -X main.buildTag=$(GIT_TAG)"

build-all: build-win build-linux build-mac

build-win:
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build $(BUILD_FLAGS) -o ./$(OUTPUT)/$(BINARY_WIN) ./cmd/custom-command/main.go

build-linux:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build $(BUILD_FLAGS) -o ./$(OUTPUT)/$(BINARY_LINUX) ./cmd/custom-command/main.go

build-mac:
	CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build $(BUILD_FLAGS) -o ./$(OUTPUT)/$(BINARY_MAC) ./cmd/custom-command/main.go
