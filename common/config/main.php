<?php
return [
    'aliases' => [
        '@bower' => '@vendor/bower-asset',
        '@npm'   => '@vendor/npm-asset',
    ],
    'vendorPath' => dirname(dirname(__DIR__)) . '/vendor',

    'modules' => [
        'cms' => [
            'class' => 'common\modules\cms\Module',
        ],
        'elearning' => [
            'class' => 'common\modules\elearning\Module',
        ],
        'user' => [
            'class' => 'dektrium\user\Module',
            'admins' => ['admin']
        ],
        'rbac' => 'dektrium\rbac\RbacWebModule',
    ],

    'components' => [
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
    ],
];
