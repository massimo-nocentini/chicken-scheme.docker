
FROM --platform=$BUILDPLATFORM ghcr.io/massimo-nocentini/chicken-scheme.docker:5.4.0

RUN sudo apt-get install -y gfortran && chicken-install -sudo scheme-indent srfi-1 srfi-18 srfi-69 srfi-19 srfi-133 s11n datatype spiffy matchable miscmacros r7rs csv-abnf sxml-transforms vector-lib

RUN wget --no-verbose https://www.lua.org/ftp/lua-5.5.0.tar.gz && tar xf lua-5.5.0.tar.gz && cd lua-5.5.0 \
	&& make CC="clang" MYCFLAGS="-fPIC" linux \
	&& sudo make CC="clang" MYCFLAGS="-fPIC" linux install \
	&& cd .. && rm -rf lua-5.5.0*

RUN wget --no-verbose https://sourceforge.net/projects/judy/files/judy/Judy-1.0.5/Judy-1.0.5.tar.gz/download -O Judy-1.0.5.tar.gz \
	&& tar xf Judy-1.0.5.tar.gz && cd judy-1.0.5 \
	&& CC="clang" CXX="clang++" ./configure --enable-64-bit \
	&& make && sudo make install && cd .. && rm -rf judy-1.0.5 Judy-1.0.5.tar.gz

RUN wget --no-verbose https://www.jjj.de/fxt/fxt-2025.06.26.tar.gz \
	&& tar xf fxt-2025.06.26.tar.gz && cd fxt \
	&& CC="clang" CXX="clang++" make && sudo make install && cd .. && rm -rf fxt fxt-2025.06.26.tar.gz

RUN wget --no-verbose https://github.com/google/highway/releases/download/1.3.0/highway-1.3.0.tar.gz \
	&& tar xf highway-1.3.0.tar.gz && cd highway-1.3.0 \
	&& mkdir bbuild && cd bbuild \
	&& CC="clang" CXX="clang++" cmake -DBUILD_SHARED_LIBS=ON .. \
	&& cmake --build . && sudo cmake --install . && cd ../.. && rm -rf highway-1.3.0 highway-1.3.0.tar.gz