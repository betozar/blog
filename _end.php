<?php

if(isset($__layout__)) {
    require_once LAYOUT_PATH.'/footer.php';
}

$flash_keys = ['errors', 'input', 'flash'];

foreach($flash_keys as $k) {
    if(isset($_SESSION[$k])) {
        unset($_SESSION[$k]);
    }
}