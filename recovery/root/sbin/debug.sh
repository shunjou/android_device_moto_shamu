#!/sbin/sh

getlogs() {
    echo "----DEBUG START----" >> /tmp/recovery.log
    dmesg >> /tmp/recovery.log
    logcat -d >> /tmp/recovery.log
    ls -la1 /vendor >> /tmp/recovery.log
    ls -la1 /vendor/firmware >> /tmp/recovery.log
    ls -la1 /vendor/firmware/keymaster >> /tmp/recovery.log
    echo "----DEBUG END----" >> /tmp/recovery.log
}

until [ -n "`grep -m 1 "Decryption failed" /tmp/recovery.log`" ]; do
    sleep 2
done

getlogs
