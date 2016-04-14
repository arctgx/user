<?php

class DbManager {

    protected static $_db_dict = array();

    public static function getDB($name='') {
        if ($name == '') {
            throw new Exception("db name empty in getDB!", 1);
        }
        if (!isset(self::$_db_dict[$name])) {
            self::$_db_dict[$name] = self::getPdo();
        }
        return self::$_db_dict[$name];
    }

    protected static function getPdo($name) {
        if ($name == '') {
            throw new Exception("db name empty in getPdo!", 1);
        }

        $dbConf = Config::getDBConf($name);
        if ($dbConf === false) {
            throw new Exception("no cofig of["$name."]!", 1);
        }
        $dsn = sprintf(
            "mysql:host=%s;port=%d;dbname=%s;charset=%s",
            $dbConf['host'], $dbConf['port'], $dbConf['db'], $dbConf['charset']
        );
        self::$db = new pdo($dsn, $dbConf['user'], $dbConf['pwd']);
        self::$db->query('set names utf8mb4');
    }
}