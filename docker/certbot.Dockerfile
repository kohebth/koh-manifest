FROM certbot/certbot

ENV MAIL_HOST=sinhvien.in

#RUN certbot certonly --standalone -d "${MAIL_HOST}" --email duy.nc164814@sis.hust.edu.vn --agree-tos --no-eff-email --non-interactive
# RUN certbot certonly --server https://acme-v02.api.letsencrypt.org/directory --manual --preferred-challenges dns -d "${MAIL_HOST}"

