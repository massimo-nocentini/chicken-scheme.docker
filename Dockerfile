
FROM --platform=$BUILDPLATFORM alpine:latest

WORKDIR /home/

RUN apk add wget build-base clang

RUN wget https://code.call-cc.org/releases/3.4.0/chicken-3.4.0.tar.gz --no-verbose \
	&& tar xf chicken-3.4.0.tar.gz && cd chicken-3.4.0 \
	&& make C_COMPILER=clang CXX_COMPILER=clang++ LINKER=clang C_COMPILER_OPTIONS="-fno-strict-aliasing -DHAVE_CHICKEN_CONFIG_H -Wno-shift-negative-value -Wno-int-to-pointer-cast -Wno-int-conversion -Wno-implicit-function-declaration -Wno-unsequenced -Wno-implicit-const-int-float-conversion -Wno-constant-logical-operand -Wno-format -Wno-absolute-value" PLATFORM=linux \
	&& make C_COMPILER=clang CXX_COMPILER=clang++ LINKER=clang PLATFORM=linux install \
	&& cd .. && rm -rf chicken-3.4.0*

ENTRYPOINT [ "csi" ]
