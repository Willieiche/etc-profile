new_content="# /etc/profile: system-wide .profile file for the Bourne shell (sh(1))


if [ \"\`id -u\`\" -eq 0 ]; then
  PATH=\"/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\"
else
  PATH=\"/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games\"
fi
export PATH

if [ \"\${PS1-}\" ]; then
  if [ \"\${BASH-}\" ] && [ \"\$BASH\" != \"/bin/sh\" ]; then
    # The file bash.bashrc already sets the default PS1.
    # PS1='\\h:\\w\\\$ '
    if [ -f /etc/bash.bashrc ]; then
      . /etc/bash.bashrc
    fi
  else
    if [ \"\$(id -u)\" -eq 0 ]; then
      PS1='# '
    else
      PS1='\$ '
    fi
  fi
fi

if [ -d /etc/profile.d ]; then
  for i in /etc/profile.d/*.sh; do
    if [ -r \$i ]; then
      . \$i
    fi
  done
  unset i
fi
"

echo "$new_content" > /etc/profile

echo "Die Änderung in /etc/profile erfolgreich geschrieben."
