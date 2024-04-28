#!/bin/bash

temp_screenshot="/tmp/screenshot.png"

grimblast --freeze copysave area $temp_screenshot && swappy -f $temp_screenshot && wl-copy
