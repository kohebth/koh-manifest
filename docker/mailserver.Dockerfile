FROM docker.io/mailserver/docker-mailserver:14.0.0

ENV MAIL_NO_REPLY=no-reply@chastnyy.online
ENV MAIL_USER=admin@chastnyy.online
ENV MAIL_PASS=!@c3tnQLoSn5J#

RUN setup email add "${MAIL_USER}" "${MAIL_PASS}"
RUN setup alias add "${MAIL_NO_REPLY}" "${MAIL_USER}"
