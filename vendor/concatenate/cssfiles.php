<?php
header("Content-type: text/css");

function autoLoader($class) {
    include $class . '.php';
}

spl_autoload_register('autoLoader');

new Concatenate('css', 'styles');