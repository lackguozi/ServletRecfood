package com.luck;

import java.io.IOException;

/**
 * Created by luckguozi on 2019/4/14.
 */
public class Testgets {
    public static void main(String[] args) {
        HbaseDao cc =new HbaseDao();
        String f =null;
        try {
             f= cc.getFoodRec("990");

        }catch (IOException e){
            e.printStackTrace();
        }
        String[] s = f.split(",");
        for (int i=0;i<s.length;i++){
            System.out.println(s[i]);
        }

    }
}
