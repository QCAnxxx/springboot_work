var GET_TABLE_URL = '/user/student';
layui.use(['form', 'layer','table'], function(){
    var form = layui.form;
    var layer = layui.layer;
    var table = layui.table;
    //监听提交
    form.on('submit(formSubmit-1)', function(data){
//        layer.msg(JSON.stringify(data.field));
        table.reload('tableList', {
            url: GET_TABLE_URL,
            where: {'page': 1, 'limit': 10, 'gradeId': data.field.gradeId}
        });
        layer.msg("更新结束")


//        $.post("http://localhost:8080/user/student", data.field,function(data){
//            if (data.code === 200) {
//                layer.msg('添加成功');
//            } else {
//                layer.msg('添加失败');
//            }
//        });
        return false;
    });
});