.PHONY: all clean

all: build

clean-patch:
	$(RM) -f *.c
	@git apply -R upstream.patch 2>/dev/null || true

clean:
	$(RM) ./main/goxhyve
	$(RM) $(GOPATH)/bin/goxhyve

build: clean
	cd ./main && go build -o ./goxhyve

install: build
	cp ./main/goxhyve /usr/local/bin
