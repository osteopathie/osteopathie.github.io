<?php

// Function to remove folders and files
function rrmdir($dir) {
  if (is_dir($dir)) {
    $files = scandir($dir);
    foreach ($files as $file)
    if ($file != "." && $file != "..") rrmdir("$dir/$file");
    rmdir($dir);
  }
  else if (file_exists($dir) && $dir != 'github.php') unlink($dir);
}

// Function to Copy folders and files
function rcopy($src, $dst) {
  if (is_dir ( $src )) {
    mkdir ( $dst );
    $files = scandir ( $src );
    foreach ( $files as $file )
    if ($file != "." && $file != "..")
    rcopy ( "$src/$file", "$dst/$file" );
  } else if (file_exists ( $src ))
  copy ( $src, $dst );
}

if ( $_POST['payload'] ) {
  rrmdir('.');
  copy('https://github.com/osteopathie/osteopathie.github.io/archive/master.zip', 'master.zip');
  $zip = new ZipArchive;
  $res = $zip->open('master.zip');
  if ($res === TRUE) {
    $zip->extractTo('.');
    $zip->close();
    rcopy('osteopathie.github.io-master', '.');
    rrmdir('osteopathie.github.io-master');
    echo 'woot!';
  } else {
    echo 'doh!';
  }
}
?>
