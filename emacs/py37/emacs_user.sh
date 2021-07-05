#!/bin/sh

## Create(if needed) this user and run command as the user:
# ENV UNAME="emacs" \
#     GNAME="emacs" \
#     UHOME="/home/emacs" \
#     UID="1000" \
#     GID="1000" \
#     WORK="/mnt/work" \
#     SHELL="/bin/bash"
## NOTE: ^^^^ Those are default values only in docker-emacs
## NOTE: The user will have "no password" sudo privilege

## Create user if it doesn't exists
if ! id "${UNAME}" >/dev/null 2>&1; then
	## Prepend the user to /etc/passwd to ensure that it will
	## override already existing users with the same IDs
	echo "${UNAME}:x:${UID}:${GID}:${UNAME},,,:${UHOME}:${SHELL}\n$(cat /etc/passwd)" > /etc/passwd
	echo "${UNAME}::17032:0:99999:7:::" >> /etc/shadow
fi

## Make sure that user is sudoer
if [ ! -f "/etc/sudoers" ]; then
	echo "${UNAME} ALL=(ALL) NOPASSWD: ALL" > "/etc/sudoers"
	chmod 0440 "/etc/sudoers"
fi

## Create user's group if it doesn't exists
u_group=$(egrep -i "^${GNAME}" /etc/group)
if [ $? -ne 0 ]; then
	echo "${GNAME}:x:${GID}:${UNAME}" >> /etc/group
elif [[ ${u_group} != *"${UNAME}"* ]]; then
	sed -i -e "s/${u_group}/${u_group},${UNAME}/g" /etc/group
fi

## Make sure that the user owns home directory
if [ -d "${UHOME}" ]
then
	home_owner="$(stat -c '%U' ${UHOME})"
	if ! id "${home_owner}" >/dev/null 2>&1 || [ "$(id -u ${UNAME})" -ne "$(id -u ${home_owner})" ]; then
		chown "${UID}":"${GID}" -R ${UHOME}
	fi
else
	mkdir -p "${UHOME}"
	chown "${UID}":"${GID}" "${UHOME}"
fi

mkdir -p "${WORK}"
chown "${UID}":"${GID}" "${WORK}"
cd "${WORK}"

