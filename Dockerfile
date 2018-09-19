FROM alpine:3.7

RUN apk add --update --no-cache curl bind-tools exim

COPY exim.conf /etc/exim/exim.conf 
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x  /app/entrypoint.sh
WORKDIR /app 
RUN chmod g=u /etc/passwd && \
    chgrp -R 0 /etc/exim &&  chmod -R g=u /etc/exim && \
    chgrp -R 0 /var/spool &&  chmod -R g=u /var/spool && \
    chgrp -R 0 /app &&  chmod -R g=u /app

USER exim
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["exim", "-bd", "-v", "-oP", "/dev/null"]
