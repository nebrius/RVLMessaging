#!/bin/sh
# Copyright (c) Bryan Hughes <bryan@nebri.us>

# This file is part of Raver Lights Messaging.

# Raver Lights Messaging is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# Raver Lights Messaging is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with Raver Lights Messaging.  If not, see <http://www.gnu.org/licenses/>.

./lint.sh

re='^[0-9]$'
if ! [[ $1 =~ $re ]] ; then
   echo "Please supply a COM port between 0 and 9" >&2; exit 1
fi

platformio run -e hub && esptool.py -p COM$1 -b 921600 write_flash 0x0 .pioenvs/hub/firmware.bin