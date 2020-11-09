NASHLIBS=$(NASHPATH)/lib

all: deps install

deps:
	mkdir $(NASHLIBS)
	git clone https://github.com/madlambda/nashcomplete.git $(NASHLIBS)/nashcomplete
	git clone https://github.com/madlambda/nashlib.git $(NASHLIBS)/nashlib

install:
	cp -r init.sh $(NASHPATH)
	cp -r aliases $(NASHPATH)

clean:
	rm -rf $(NASHPATH)/init.sh
	rm -rf $(NASHPATH)/aliases
	rm -rf $(NASHLIBS)/nashcomplete
	rm -rf $(NASHLIBS)/nashlib
