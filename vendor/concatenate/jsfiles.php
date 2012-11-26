<?php
header("Content-type: text/javascript");

function autoLoader($class) {
    include $class . '.php';
}

spl_autoload_register('autoLoader');

new Concatenate('js', 'application');