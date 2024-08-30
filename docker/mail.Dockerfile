FROM docker.io/mailserver/docker-mailserver:14.0.0

ENV MAIL_USER=admin@chastnyy.online
ENV MAIL_PASS=!@c3tnQLoSn5J#
RUN setup email add "${MAIL_USER}" "${MAIL_PASS}"

# alias way to create an email account
# RUN echo "${MAIL_USER}|$(doveadm pw -s SHA512-CRYPT -u ${MAIL_USER} -p ${MAIL_PASS})" >> "/tmp/docker-mailserver/postfix-accounts.cf"

