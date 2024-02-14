FROM ubuntu_wget as builder
FROM scratch
WORKDIR /var/docker_data/exersice7.8.6
#Copy library from Ubuntu:23.10
COPY --from=builder /lib/x86_64-linux-gnu/libc.so.6 /lib/x86_64-linux-gnu/
COPY --from=builder /lib64/ld-linux-x86-64.so.2 /lib64/
COPY --from=builder /lib/x86_64-linux-gnu/libtinfo.so.6 /lib/x86_64-linux-gnu/
COPY --from=builder /lib/x86_64-linux-gnu/libselinux.so.1 /lib/x86_64-linux-gnu/
COPY --from=builder /lib/x86_64-linux-gnu/libc.so.6 /lib/x86_64-linux-gnu/
COPY --from=builder /lib/x86_64-linux-gnu/libpcre2-8.so.0 /lib/x86_64-linux-gnu/
COPY --from=builder /lib64/ld-linux-x86-64.so.2 /lib64/
COPY --from=builder /lib/x86_64-linux-gnu/libselinux.so.1 /lib/x86_64-linux-gnu/
#Copy application
COPY --from=builder /usr/bin/hostname /usr/bin/sh /usr/bin/bash /usr/bin/ls /usr/bin/find /bin/
#Exec command
CMD wget https://apps.skillfactory.ru/favicon.ico
