#!/bin/bash


# copy your public key up to the authorized keys on another machine
cat ~/.ssh/id_rsa.pub | ssh $host 'cat >> ~/.ssh/authorized_keys'
