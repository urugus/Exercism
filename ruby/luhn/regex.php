<?php

if ( preg_match("/[\d\s]{1,}/g", $file) ){
	echo 'マッチします。';
}