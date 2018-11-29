<?php
/**
 * Created by PhpStorm.
 * User: Joql
 * Date: 2018/11/29
 * Time: 20:00
 */

namespace app\index\controller;


use think\Controller;
use think\Db;

class Record extends Controller
{
    public function in()
    {
        $param = input('param.');
        if(empty($param['type']) || empty($param['number'])){
            return json([
                'code' => 0,
            ]);
        }
        $data['ctime'] = time();
        $data['type'] = $param['type'];
        $data['number'] = $param['number'];

        Db::table('snake_record')->insert($data);
        return json([
            'code' => 1,
        ]);
    }

}