<?php
// Database credentials
$dbHost = 'localhost';
$dbUser = 'dysin_db_user';
$dbPass = 't2A6K7L0Xqpy';
$dbName = 'dysin_db';

// Backup folder
$backupDir = '/home/ngsslcom/dysin.ng-ssl.com/databasebackup/';
if (!file_exists($backupDir)) {
    mkdir($backupDir, 0777, true);
}

// File name with date
$backupFile = $backupDir . 'dysin_db_' . date('M_d_Y_H_i_s') . '.sql.gz';

// Full path of mysqldump
$mysqldumpPath = '/usr/bin/mysqldump'; // Adjust if needed (check with `which mysqldump`)

// Command
$command = "$mysqldumpPath -u$dbUser -p'$dbPass' $dbName | gzip > $backupFile";

// Execute command
exec($command, $output, $result);

// Check result
if ($result === 0) {
    echo "✅ Backup successful! File saved to: $backupFile\n";
} else {
    echo "❌ Backup failed! Please check database credentials or permissions.\n";
}
?>
