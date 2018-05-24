一、ActiveRecord活动记录的CURD

DQL
1. 查询所有
Article::findAll(['status'=>1]);

2.查询一条
Article::findOne(1);                   //根据ID查询
Article::findOne(['status' => 1]);     //根据条件查询

3.find()方法返回yii\db\ActiveQuery查询
Article::find()->where(['id'=>1])->one();                          //ID等于1的一条数据
Article::find()->where(['status'=>1])->all();                      //状态等于1的所有数据
Article::find()->where('status=:status',[':status'=>1])->all();    //状态等于1的所有数据

//查询状态等于1的数据并根据pubdate排序
Article::find()->where(['status'=>1])->orderBy('pubdate DESC')->all();

//查询状态等于1的数据并根据pubdate排序,从第10条开始，取4条
Article::find()->where(['status'=>1])->orderBy('pubdate ASC')->offset(10)->limit(4)->all();
DML
//save()方法的第一个参数布尔值表示更新或插入时是否开启验证，默认为true
$article = Article::findOne(1);
$article->title = '更改测试1标题';
$article->save();

//跟新指定
Article::updateAll(['title'=>'测试1指定的跟新'],['id'=>1]);

//添加一条
$article = new Article();
$article->title = '测试添加标题1';
$article->content = '测试添加内容1';
$article->desc = '测试添加描述1';
$article->save();

//删除一条
Article::findOne(16)->delete();

//删除指定
Article::deleteAll(['id'=>16]);
二、查询构建器yii\db\Query

$db = new \yii\db\Query();
1.查询一条ID为2的数据
$db->select('id,title,content')->from('article')->where('id=:id',[':id'=>2])->one();
$db->select('id,title,content')->from('article')->where(['id'=>2])->one());

2.查询多条
$db->select('id,title,content')->from('article')->where(['status'=>1])->all();
$db->select('id,title,content')->from('article')->where(['id'=>[1,2]])->all()

3.根据pubdate排序,从第10条开始，取4条
$db->select('id,title,content')->from('article')->orderBy('pubdate DESC')->offset(10)->limit(4)->all();

4.统计查询
$db->select('id')->from('article')->count();
三、yii\db\Command

DQL
$db = \Yii::$app->db;
可通过$db->tablePrefix获取表前缀如果有的话

1.查询一条
$db->createCommand('SELECT * FROM `article`')->queryOne();

2.绑定单个防SQL注入参数
$db->createCommand('SELECT * FROM `article` WHERE id=:id')->bindValue(":id",2)->queryOne();

3.绑定多个防SQL注入参数
$db->createCommand('SELECT * FROM `article` WHERE id=:id AND status=:status')->bindValues([':id'=>1,':status'=>1])->queryOne();

4.查询多条
$db->createCommand('SELECT * FROM `article`')->queryAll();

5.统计查询
$db->createCommand('SELECT COUNT("id") FROM `article`')->queryScalar();
DML
1.更新数据
$db->createCommand()->update('`article`',['status'=>0],'id=:id',[':id'=>9])->execute();

2.插入数据
$db->createCommand()->insert('`article`',['title'=>'标题16','desc'=>'描述16','content'=>'内容16'])->execute();

3.一次插入多行
$db->createCommand()->batchInsert('`article`',['title','desc','content'],[
['17','17','17'],
['18','18','18'],
['19','19','19']
])->execute();

4.删除数据
$db->createCommand()->delete('`article`','status=0')->execute();
ActiveRecord 类型的增删改查以\app\models\Articl模型为准 ， 表名尽量和model层文件名称相同，也可以定义静态方法tablename来选择表名进行增伤改查操作

操作以下函数

1) 查询数据



①findAll 查询多条数据 \app\models\Article::findAll([‘status’ => ‘1’]); //查询 Article , status 为 1 的所有数据



②根据 findOne 进行查询 ， 根式\app\models\Article::findOne(‘条件’); \app\models\Article::findOne(1); //直接根据 id 查询 \app\models\Article::findOne([‘status’ => ‘1’]); //根据指定条件查询



③根据 find()进行查询 , find 可以连接查询//查询一条 id 等于 1 的数据



\app\model\Article::find()->where([‘id’ => 1])->one(); //查询 status 等于 1 的所有数据 \app\model\Article::find()->where([‘status’ => ‘1’])->all();

或



\app\model\Article::find()->where(‘status=:status’ , [‘:status’ => ‘1’])->all(); //查询 status 等于 1 的所有数据 , 根据 date 排序 \app\model\Article::find()->where([‘status’ => ‘1’])->orderBy(‘date DESC’)->all();



//查询 status 等于 1 的数据 , 根据 date 排序 ， 从第 5 条开始，读取 3 条

\app\model\Article::find()->where([‘status’=>‘1’])->orderBy(‘date DESC’)->offset(5) ->limit(3) ->all();



④更新一条数据



$article = \app\models\Article::findOne(1); $article -> title = ‘change title’;

//save 函数第一个参数默认为 true , 就是更新或插入启动验证



//如果不想使用验证可以用 save(false); $article -> save();



⑤更新指定属性 updateAll(‘更新的属性’ , ‘条件’ ) \app\models\Article::updateAll([‘title’ => ‘change title’ ] , [‘id’ => 1]);



⑥添加一条新数据



$article = new \app\models\Article(); $article -> title = ‘new one’;

$article -> content = ‘this is new’; $article -> save();



⑦删除一条数据



\app\models\Article::findOne(1)->delete();



⑧删除指定条件的数据



\app\models\Article::deleteAll([‘id’ => 2]);



2、\yii\db\Query 查询数据 $db = new \yii\db\Query; //查询一条 id 等于 2 的数据



$db->select('id')->from('mrs_article')->where("id=:id " , [':id' => 2])->one(); $db->select('id')->from('mrs_article')->where([‘id’ => 1])->one(); //查询多条 $db->select('id')->from('mrs_article')->where([‘status’ => ‘1’])->all(); //in 查询多条 $db->select('id')->from('mrs_article')->where([‘id’ =>[1,2]])->all(); //根据时间排序 ,并且从第 5 条开始获取 3 条



$db->select(‘id’)->from(‘mrs_article’)->orderBy(‘date DESC’)->offset(5)->limit(3)->all()



//查询数据总个数



$db->select('id')->from('mrs_article')->count();



Dao方法进行增删改查



3、Yii::$app->db 进行增删改查



① 查询数据//查询一条数据



\Yii::$app->db->createCommand(“SELECT * FROM mrs_article”)->queryOne();



//绑定单个防注入参数



\Yii::$app->db->createCommand(“SELECT * FROM mrs_article where id=:id”) ->bindValue(“:id” , 2)->queryOne();

//绑定多个防注入参数



\Yii::$app->db->createCommand(“SELECT * FROM mrs_article where id=:id AND status=:status”) ->bindValues([‘:id’ => 1 , ‘:status’ => ‘1’])->queryOne();

//查询多条数据



\Yii::$app->db->createCommand(“SELECT * FROM mrs_article”)->queryAll();



//查询指定数据的字段的数据



$db =\Yii::$app->db;



$db->createCommand(“SELECT COUNT(*) FROM mrs_article”)->queryScalar();



② 更新数据



$db = \Yii::$app->db->createCommand();



$db->update(‘mrs_article’ , [‘status’=>0] , “id=:id” , [‘:id’ => 1])->execute();



③插入数据



$db = \Yii::$app->db->createCommand(); $db->insert(‘mrs_article’ , [‘title’=>’new Record’] )->execute();



④删除数据



$db = \Yii::$app->db->createCommand(); $db>delete(‘mrs_article’ , “id=:id” , [‘:id’ => 1] )->execute();