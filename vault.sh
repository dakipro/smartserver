#!/bin/bash

# Search recursively through the current directory for encrypted values
#   - assumes your vault password is in a file vpass

ACTION=""
if [ "$1" != "" ]; then
    ACTION="$1"
else
    echo "Usage: vault.sh encrypt|decrypt"
    exit 1
fi

#echo "${VAULTPW}" > /tmp/mypipe &
#ansible-playbook ... --vault-password-file=$vaultpipe

echo -n "Ansible Password: "
read -s PWD
echo ""

echo -n "Verify Password : "
read -s PWD_check
echo ""

if [ "${PWD}" != "${PWD_check}" ]; then
    echo "password not equal"
    exit;
fi

vaultpipe=$(mktemp)
echo "${PWD}" > $vaultpipe &

if [ "${ACTION}" = "encrypt" ]; then
  grep -rilL ANSIBLE_VAULT ./config/marvin/vault/ | while read N 
  do 
    echo encrypt $N
    ansible-vault --vault-password-file $vaultpipe encrypt $N
  done
elif [ "${ACTION}" = "decrypt" ]; then
  grep -ril ANSIBLE_VAULT ./config/marvin/vault/ | while read N 
  do 
    echo decrypt $N
    ansible-vault --vault-password-file $vaultpipe decrypt $N
  done
fi

trap "{ rm -f $vaultpipe; }" EXIT
