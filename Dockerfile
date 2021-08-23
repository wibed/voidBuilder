FROM voidlinux/voidlinux-musl:latest



RUN xbps-install -Syu \
  && xbps-install -Syu \
    git \
    bash \
    file \
    binutils \
    make \
    gcc \
    gcc-ada \
    bsdtar \
    patch \
    pkg-config \
    zlib-devel \
    flex

ARG UID
RUN useradd -u 1002 user
WORKDIR /home/user

ARG PKGNAME
COPY ./${PKGNAME} ./${PKGNAME}
RUN chown -R user:user .

USER user

WORKDIR ${PKGNAME}
RUN git branch -l

ENTRYPOINT [ "/bin/sh", "-c", "./xbps-src binary-bootstrap && ./xbps-src pkg libcgroup"]
