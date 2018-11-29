<?php
namespace app\index\controller;

use app\admin\model\ArticleModel;
use think\Controller;
use think\Db;

class Index extends Controller
{
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

    public function getGoods()
    {
        $data = Db::table('snake_record')
            ->field('g.*,r.id as pid')
            ->alias('r')
            ->join('snake_goods g', 'g.product_id = r.number', 'left')
            ->where([
                'r.type' => 1,
                'r.state' => 1,
                'r.ctime' => ['>',time()-120],
            ])
            ->order('pid desc')
            ->find();
        if(empty($data)){
            return json([
                'code' => 0,
            ]);
        }
        Db::table('snake_record')->where(['id'=>$data['pid']])->update(['state'=>2]);
        $data['img'] = '<img src="' . $data['img'] . '" width="66px" height="66px">';
        $data['operate'] = showOperate($this->makeButton($data['pid']));
        return json([
            'code' => 1,
            'data' => [$data],
        ]);
    }

    /**
     * 拼装操作按钮
     * @param $id
     * @return array
     */
    private function makeButton($id)
    {
        return [
            '删除' => [
                'auth' => 'index/articledel',
                'href' => "javascript:articleDel(" . $id . ")",
                'btnStyle' => 'danger',
                'icon' => 'fa fa-trash-o'
            ]
        ];
    }
}
