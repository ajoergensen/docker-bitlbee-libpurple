Bitlbee
=======

[Bitlbee](https://www.bitlbee.org/main.php/news.r.html) is an IRC to other chat networks gateway

This version uses Bitlbee nightly compiled with [libpurple](https://wiki.bitlbee.org/HowtoPurple) 

The following 3rd party plugins are included:

- [Facebook](https://wiki.bitlbee.org/HowtoFacebookMQTT) 
- [Hangouts](https://wiki.bitlbee.org/Hangouts)
- [SIPE](https://wiki.bitlbee.org/HowtoSIPE) (Lync/Skype for Business)
- [Skype](https://wiki.bitlbee.org/HowtoSkypeWeb)
- [Slack](https://github.com/dylex/slack-libpurple)
- [Steam](https://github.com/jgeboski/bitlbee-steam)
- [Telegram](https://github.com/majn/telegram-purple)

### Usage

 `docker run --rm --name bitlbee -v ./storage:/var/lib/bitlbee ajoergensen/bitlbee-purple`

### Environment

- `PUID` - Changes the uid of the app user, default 911
- `PGID` - Changes the gid of the app group, default 911
- `DISABLE_SYSLOG` - If set to TRUE, do not run rsyslog inside the container. Default is FALSE
- `SMTP_HOST` - Change the SMTP relay server used by ssmtp (sendmail)
- `SMTP_USER` - Username for the SMTP relay server
- `SMTP_PASS` - Password for the SMTP relay server
- `SMTP_PORT` - Outgoing SMTP port, default 587
- `SMTP_SECURE` - Does the SMTP server requires a secure connection, default TRUE
- `SMTP_TLS` - Use STARTTLS, default TRUE (if SMTP_TLS is FALSE and SMTP_SECURE is true, SMTP over SSL will be used)
- `SMTP_MASQ` - Masquerade outbound emails using this domain, default empty

### Persistent data

`/var/lib/bitlbee` is defined as a volume and used for storing bitlbee's configuration.
