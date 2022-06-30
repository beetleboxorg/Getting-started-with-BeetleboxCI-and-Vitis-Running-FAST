#!/bin/bash -f
chmod 777 Hardware/transfer.expect
chmod 777 Hardware/sleep.sh
chmod 777 Hardware/run.expect
Hardware/transfer.expect
Hardware/sleep.sh
Hardware/run.expect

