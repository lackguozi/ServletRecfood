package com.luck;

/**
 * Created by luckguozi on 2019/4/8.
 */

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.client.*;
import org.apache.hadoop.hbase.util.Bytes;
import java.io.IOException;
public class Hbase {
    HBaseAdmin admin = null;
    Configuration configuration = null;
    //Connection connection=null;
    private static class Holder{
        private  static Hbase hbase =new Hbase();
    }
    /**
     * @description 私有构造方法 单例模式
     * @param
     */
    private Hbase(){
        configuration = new Configuration();
        configuration.set("hbase.zookeeper.quorum","127.0.0.1");  //hbase 服务地址
        configuration.set("hbase.zookeeper.property.clientPort","2181"); //端口号
        try {
            admin = new HBaseAdmin(configuration) ;//过时方法
            //Connection connection= ConnectionFactory.createConnection(configuration);
            //admin=connection.getAdmin();
            //上面的方法没有过时，某些原因采用过时写法
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static Hbase getInstance() {
        return Holder.hbase;
    }
    public void show(){
        if(admin !=null){
            System.out.println("连接成功");
        }
    }


    /**
     * @description 根据表名获取实例
     * @param tablename 表名
     */
    public HTable getTable(String tablename){

        HTable table = null;
        try {
            table=new HTable(configuration,tablename);
        }catch (IOException e){
            e.printStackTrace();
        }
        return table;
    }
    //抛出异常没有初始化，上面的是过时的写法,由于各种原因不得不采用上面的写法,等待优化
        /*try{
            Table table =connection.getTable(TableName.valueOf(tablename));
            return table;
        }catch (IOException e){
            e.printStackTrace();
        }

    }*/

    /**
     * @description 添加一条记录
     * @param tableName
     * @param rowkey
     * @param cf columnfamily
     * @param column
     * @param value
     */
    public void put(String tableName, String rowkey, String cf, String column, String value) {
        HTable table = getTable(tableName);
        Put put = new Put(Bytes.toBytes(rowkey));
        put.addColumn(Bytes.toBytes(cf), Bytes.toBytes(column), Bytes.toBytes(value));
        try {
            table.put(put);
        } catch (IOException e) {
            e.printStackTrace();
        }
        finally {
            try {
                table.close();
            }catch (IOException e){
                e.printStackTrace();
            }
        }
    }



}
