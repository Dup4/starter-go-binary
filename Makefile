NAME?=starter-go

PKGLIST=$(shell go list ./...)

all:
	go build -ldflags "-s -w"  -o output/$(NAME) *.go

test:
	go vet $(PKGLIST)
	go test $(PKGLIST) -race -coverprofile=unittest-coverage.out

ut:
	go test $(PKGLIST) -race -coverprofile=unittest-coverage.out

bench:
	go test $(PKGLIST) -run=NOTEST -bench=. -cpu=1,2,4,8

.PHONY: clean
clean:
	rm -fr $(NAME)
