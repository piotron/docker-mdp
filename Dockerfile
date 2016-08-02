FROM resin/armhf-alpine
MAINTAINER Undefined Network - Piotr 'Piotron' Radosz mail@piotron.net

# Put here some colors
ENV TERM xterm-256color


# Installing application dependencies, compiling 
# and removing unnecessary dependencies to keep image as small as possible

RUN adduser -D -H presenter && \
 apk add --no-cache git make g++ ncurses ncurses-dev && \
 git clone https://github.com/visit1985/mdp.git /src && \
 cd src && \
    make && \
    make install && \
 cd .. && \
 rm -Rf srv && \
 mkdir /presentations && \
 apk del git make g++ ncurses-dev

# Set entrypoint and directory workdir
# This will give application information where to search presentations.
USER presenter
WORKDIR /presentations
ENTRYPOINT ["/usr/local/bin/mdp"]
CMD ["howto.mdp"]


# Copy "How to" presentation

COPY presentations/howto.mdp /presentations
