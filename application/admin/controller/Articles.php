<?php
// +----------------------------------------------------------------------
// | snake
// +----------------------------------------------------------------------
// | Copyright (c) 2016~2022 http://baiyf.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: NickBai <1902822973@qq.com>
// +----------------------------------------------------------------------
namespace app\admin\controller;

use app\admin\model\ArticleModel;
use think\Db;

class Articles extends Base
{
    // 文章列表
    public function index()
    {
        if(request()->isAjax()){

            $param = input('param.');

            $limit = $param['pageSize'];
            $offset = ($param['pageNumber'] - 1) * $limit;

            $where = [];
            if (!empty($param['searchText'])) {
                $where['title'] = ['like', '%' . $param['searchText'] . '%'];
            }

            $article = new ArticleModel();
            $selectResult = $article->getArticlesByWhere($where, $offset, $limit);

            foreach($selectResult as $key=>$vo){
                $selectResult[$key]['img'] = '<img src="' . $vo['img'] . '" width="66px" height="66px">';
                $selectResult[$key]['ctime'] = date('Y-m-d H:i:s');
                $selectResult[$key]['operate'] = showOperate($this->makeButton($vo['id']));
            }

            $return['total'] = $article->getAllArticles($where);  // 总数据
            $return['rows'] = $selectResult;

            return json($return);
        }

        return $this->fetch();
    }

    // 添加文章
    public function articleAdd()
    {
        if(request()->isPost()){
            $param = input('post.');

            unset($param['file']);
            $param['ctime'] = time();

            $article = new ArticleModel();
            $flag = $article->addArticle($param);

            return json(msg($flag['code'], $flag['data'], $flag['msg']));
        }

        return $this->fetch();
    }

    public function articleEdit()
    {
        $article = new ArticleModel();
        if(request()->isPost()){

            $param = input('post.');
            unset($param['file']);
            $flag = $article->editArticle($param);

            return json(msg($flag['code'], $flag['data'], $flag['msg']));
        }

        $id = input('param.id');
        $this->assign([
            'article' => $article->getOneArticle($id)
        ]);
        return $this->fetch();
    }

    public function articleDel()
    {
        $id = input('param.id');

        $article = new ArticleModel();
        $flag = $article->delArticle($id);
        return json(msg($flag['code'], $flag['data'], $flag['msg']));
    }


    public function getNumber()
    {
        $data = Db::table('snake_record')
            ->field('number,id')
            ->order('id desc')
            ->where([
                'type' => 2,
                'state' => 1,
                'ctime' => ['>', time()- 120],
            ])
            ->find();
        if(empty($data)){
            return json([
                'code' => 0,
            ]);
        }
        Db::table('snake_record')->where(['id'=>$data['id']])->update(['state'=>2]);
        return json([
            'code' => 1,
            'data' => $data['number']
        ]);
    }

    // 上传缩略图
    public function uploadImg()
    {
        if(request()->isAjax()){

            $file = request()->file('file');
            // 移动到框架应用根目录/public/uploads/ 目录下
            $info = $file->move(ROOT_PATH . 'public' . DS . 'upload');
            if($info){
                $src =  '/upload' . '/' . date('Ymd') . '/' . $info->getFilename();
                return json(msg(0, ['src' => $src], ''));
            }else{
                // 上传失败获取错误信息
                return json(msg(-1, '', $file->getError()));
            }
        }
    }

    /**
     * 拼装操作按钮
     * @param $id
     * @return array
     */
    private function makeButton($id)
    {
        return [
            '编辑' => [
                'auth' => 'articles/articleedit',
                'href' => url('articles/articleedit', ['id' => $id]),
                'btnStyle' => 'primary',
                'icon' => 'fa fa-paste'
            ],
            '删除' => [
                'auth' => 'articles/articledel',
                'href' => "javascript:articleDel(" . $id . ")",
                'btnStyle' => 'danger',
                'icon' => 'fa fa-trash-o'
            ]
        ];
    }
}
